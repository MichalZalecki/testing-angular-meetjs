'use strict'

describe 'message directive', ->

  element = scope = $compile = null

  beforeEach module 'message.message-directive'
  beforeEach inject ($rootScope, _$compile_) ->
    $compile = _$compile_
    scope = $rootScope.$new()
    scope.style = 'success'
    scope.text = 'Hello, World!'

  describe 'with index and fn', ->

    beforeEach ->
      scope.fn = (id) ->
        return
      spyOn(scope, 'fn')
      element = '<message style="{{ style }}" index="3" fn="fn(index)">{{ text }}</message>'
      element = $compile(element)(scope)
      scope.$digest()

    it 'should have .alert.alert-success and .close', ->
      expect(element.find('.alert.alert-success').length).toEqual 1
      expect(element.find('.close').length).toEqual 1

    it 'should have message', ->
      expect(element.text()).toContain 'Hello, World!'

    it 'should call fn on close', ->
      expect(scope.fn).not.toHaveBeenCalled()
      element.find('.close').click()
      expect(scope.fn).toHaveBeenCalledWith('3')

  describe 'without index and fn', ->

    isolateScope = null

    beforeEach ->
      scope.style = 'info'
      scope.text = 'Hello, Wroclaw!'
      element = '<message style="{{ style }}">{{ text }}</message>'
      element = $compile(element)(scope)
      scope.$digest()
      isolateScope = element.isolateScope()
      spyOn(isolateScope, '$destroy')

    it 'should have .alert.alert-info and .close', ->
      expect(element.find('.alert.alert-info').length).toEqual 1
      expect(element.find('.close').length).toEqual 1

    it 'should have message', ->
      expect(element.text()).toContain 'Hello, Wroclaw!'

    it 'should call scope.$destroy on close', ->
      expect(isolateScope.$destroy).not.toHaveBeenCalled()
      element.find('.close').click()
      expect(isolateScope.$destroy).toHaveBeenCalled()

    it 'should call element.remove on close', ->
      # to check whether element was removed we need a wrapper
      element = '<div><message style="{{ style }}">{{ text }}</message></div>'
      element = $compile(element)(scope)
      scope.$digest()
      element.find('.close').click()
      expect(element.html()).toEqual ''