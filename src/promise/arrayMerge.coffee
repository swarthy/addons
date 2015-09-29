_ = require 'lodash'
module.exports = (array)->
  unless array && array.length
    throw new Error 'Can only merge elements in array'
  if _.isArray array[0]
    [].concat array...
  else
    if _.isObject array[0]
      res = {}
      for obj in array
        for key of obj
          if _.isArray obj[key]
            unless res[key]
              res[key] = []
            res[key] = res[key].concat obj[key]
          else
            res[key] = obj[key]
      res
