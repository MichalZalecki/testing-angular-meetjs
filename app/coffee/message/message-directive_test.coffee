'use strict'

describe 'message directive', ->

  element = scope = isolateScope = $compile =null

  beforeEach module 'message.message-directive'
  beforeEach inject ($rootScope) ->
    scope = $rootScope.$new()
    scope.style = 'success'
    scope.text = 'Hello, World!'

  describe 'with index and fn', ->

    beforeEach inject (_$compile_) ->
      $compile = _$compile_
      scope.fn = (id) ->
        return
      spyOn(scope, 'fn')

      element = '<message style="{{ style }}" index="123" fn="fn(index)">{{ text }}</message>'
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
      expect(scope.fn).toHaveBeenCalledWith('123')

  describe 'without index and fn', ->

    beforeEach inject ($compile) ->
      element = '<message style="{{ style }}">{{ text }}</message>'
      element = $compile(element)(scope)
      scope.$digest()

      isolateScope = element.isolateScope()
      spyOn(isolateScope, '$destroy')

    it 'should have .alert.alert-success and .close', ->
      expect(element.find('.alert.alert-success').length).toEqual 1
      expect(element.find('.close').length).toEqual 1

    it 'should have message', ->
      expect(element.text()).toContain 'Hello, World!'

    it 'should call scope.$destroy on close', ->
      expect(isolateScope.$destroy).not.toHaveBeenCalled()
      element.find('.close').click()
      expect(isolateScope.$destroy).toHaveBeenCalled()

    it 'should call element.remove on close', ->
      element = '<div><message style="{{ style }}">{{ text }}</message></div>'
      element = $compile(element)(scope)
      scope.$digest()

      element.find('.close').click()
      expect(element.html()).toEqual ''