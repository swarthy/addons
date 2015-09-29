Promise = require 'bluebird'
_ = require 'lodash'
arrayMerge = require './arrayMerge'
module.exports =
  splitBy: (count, array, func)->
    unless arguments.length is 3
      return Promise.reject new Error 'Must be 3 arguments'
    arrs = _.chunk array, count
    Promise.all _.map arrs, (subArray)-> func subArray
    .then (arrayOfResults)->
      arrayMerge arrayOfResults
  splitBySeq: (count, array, func)->
    unless arguments.length is 3
      return Promise.reject new Error 'Must be 3 arguments'
    arrs = _.chunk array, count
    Promise.reduce arrs, (result, subArray)->
      func subArray
      .then (res)->
        result.concat [res]
    , []
    .then (arrayOfResults)->
      arrayMerge arrayOfResults
