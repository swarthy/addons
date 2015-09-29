arrayMerge = require '../../../src/common/arrayMerge'
describe 'Promise::arrayMerge', ->
  it 'should merge array of objects into one', ->
    arr = [{field1: [1,2], limit: 1},{ field1: [3,4], limit: 2}]
    result = arrayMerge arr
    result.field1.length.should.be.equal 4
    result.limit.should.be.equal 2
  it 'should merge array of arrays into one', ->
    arr = [[1,2],[3,4]]
    result = arrayMerge arr
    result.length.should.be.equal 4
