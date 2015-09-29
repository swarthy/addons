Promise = require 'bluebird'
splitBy = require('../../../src/common/promiseAddons').splitBy
splitBySeq = require('../../../src/common/promiseAddons').splitBySeq
describe.only 'Promise::Split Promise', ->
  it 'should split array on 3 parts', ->
    arr = [1,2,3,4,5,6]
    callCount = 0
    splitBy 2, arr, (subArr)->
      callCount++
    .then ->
      callCount.should.be.equal 3
  it 'should merge result', ->
    arr = [1,2,3,4,5,6]
    splitBy 2, arr, (subArr)->
      field1: _.map subArr, (num) -> num * 2
    .then (result)->
      for elem,index in arr
        result.field1[index].should.be.equal elem * 2
  it 'should run sequence ~90ms', ->
    arr = [1,2,3,4,5,6]
    splitBySeq 2, arr, (subArr)->
      Promise.delay(30)
      .then ->
        subArr
    .then (result)->
      result.length.should.be.equal 6
