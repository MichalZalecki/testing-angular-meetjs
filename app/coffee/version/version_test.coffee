'use strict'

describe 'version module', ->

  beforeEach module 'version'

  describe 'version service', ->

    it 'should return current version', inject (version) ->
      expect(version).toEqual '1.0.0'