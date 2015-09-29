sinon = require('sinon')
sinonAsPromised = require('sinon-as-promised')

chai = require('chai')
chaiAsPromised = require('chai-as-promised')
sinonChai = require('sinon-chai')

chai.use chaiAsPromised
chai.use sinonChai

chai.config.includeStack = true

global.expect = chai.expect
global.should = chai.should()
global.AssertionError = chai.AssertionError
global.Assertion = chai.Assertion
global.assert = chai.assert
global.sinon = sinon
global._ = require 'lodash'

global.helpers =
  inspect: require './helpers/inspect'

require './helpers/mixins'
