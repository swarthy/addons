util = require 'util'
module.exports = (obj)->
  util.inspect(obj, {showHidden: false, depth: null})
