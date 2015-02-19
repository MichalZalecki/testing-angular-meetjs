'use strict'

describe 'version module', ->

  beforeEach module 'version'

  describe 'version directive', ->

    element = null

    beforeEach inject ($compile, $rootScope) ->
      element = '<p version></p>'
      element = $compile(element)($rootScope.$new())

    it 'should contain name and current version', ->
      expect(element.text()).toEqual 'Anguloffee 1.0.0'