'use strict'

describe 'myAppCtrl', ->

  myAppCtrl = scope = null

  beforeEach module 'myApp'
  beforeEach inject ($rootScope, $controller) ->
    scope = $rootScope.$new()
    myAppCtrl = $controller 'myAppCtrl',
      '$scope': scope

    scope.$digest()

  it 'should have initial msgs value', ->
    expect(scope.msgs).toEqual []

  it 'should have addMsg method', ->
    expect(scope.addMsg).toEqual jasmine.any Function

  it 'should add message with addMsg', ->
    msgsBefore = angular.copy(scope.msgs)
    scope.addMsg('success', 'Foo')
    msgsAfter = angular.copy(scope.msgs)

    expect(msgsAfter.length).toBeGreaterThan(msgsBefore)
    expect(msgsAfter[0]).toEqual({style: 'success', text: 'Foo'})