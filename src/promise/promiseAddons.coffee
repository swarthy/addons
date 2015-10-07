Promise = require 'bluebird'
_ = require 'lodash'
arrayMerge = require './arrayMerge'
module.exports =
  splitBy: (count, array, func)->
    unless arguments.length is 3
      return Promise.reject new Error 'Must be 3 arguments'
    arrs = _.chunk array, count
    unless arrs.length
      arrs = [[]]
    Promise.all _.map arrs, (subArray)-> func subArray
    .then (arrayOfResults)->
      arrayMerge arrayOfResults
  splitBySeq: (count, array, func)->
    unless arguments.length is 3
      return Promise.reject new Error 'Must be 3 arguments'
    arrs = _.chunk array, count
    unless arrs.length
      arrs = [[]]
    Promise.reduce arrs, (result, subArray)->
      Promise.resolve func subArray
      .then (res)->
        result.concat [res]
    , []
    .then (arrayOfResults)->
      arrayMerge arrayOfResults
  sequence: (array, func)->
    Promise.reduce array, (total, arrayItem)->
      Promise.resolve func arrayItem
      .then (res)->
        total.concat [res]
    , []
