bluebird = require 'bluebird'
inspect = require './inspect'
showError = ->
  @catch (err)->
    console.error inspect err
    throw err

showAndCatchError = ->
  @catch (err)->
    console.error inspect err

Promise::showError = bluebird::showError = showError
Promise::showAndCatchError = bluebird::showAndCatchError = showAndCatchError
