Promise = require 'bluebird'
_ = require 'lodash'
arrayMerge = require './arrayMerge'
module.exports =
  splitBy: (count, array, func)->
    arrs = _.chunk array, count
    Promise.all _.map arrs, (subArray)-> func subArray
    .then (arrayOfResults)->
      arrayMerge arrayOfResults
  splitBySeq: (count, array, func)->
    arrs = _.chunk array, count
    Promise.reduce arrs, (result, subArray)->
      func subArray
      .then (res)->
        result.concat [res]
    , []
    .then (arrayOfResults)->
      arrayMerge arrayOfResults
