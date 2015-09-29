Promise = require 'bluebird'
promiseAddons = require('../../../src/promise/promiseAddons')

describe.only 'Promise::Split Promise', ->
  it 'should split array on 3 parts', ->
    arr = [1,2,3,4,5,6]
    callCount = 0
    promiseAddons.splitBy 2, arr, (subArr)->
      callCount++
    .then ->
      callCount.should.be.equal 3
  it 'should merge result', ->
    arr = [1,2,3,4,5,6]
    promiseAddons.splitBy 2, arr, (subArr)->
      field1: _.map subArr, (num) -> num * 2
    .then (result)->
      for elem,index in arr
        result.field1[index].should.be.equal elem * 2
  it 'should run sequence ~90ms', ->
    arr = [1,2,3,4,5,6]
    promiseAddons.splitBySeq 2, arr, (subArr)->
      Promise.delay(30)
      .then ->
        subArr
    .then (result)->
      result.length.should.be.equal 6
  it 'should throw error on wrong argument count', ->
    errHandler = sinon.spy()
    promiseAddons.splitBy 2, []
    .catch errHandler
    .then ->
      errHandler.called.should.be.ok
