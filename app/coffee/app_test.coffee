'use strict'

describe 'MainCtrl', ->

  scope = null

  beforeEach module 'app'
  beforeEach inject ($rootScope, $controller) ->
    scope = $rootScope.$new()
    $controller 'MainCtrl',
      '$scope': scope
      appName: 'FakeAppName'
    scope.$digest()

  it 'should have initial msgs and appName values', ->
    expect(scope.MainCtrl.msgs).toEqual []
    expect(scope.MainCtrl.appName).toEqual 'FakeAppName'

  it 'should have addMsg method', ->
    expect(scope.MainCtrl.addMsg).toEqual jasmine.any Function

  it 'should add message with addMsg', ->
    msgsBefore = angular.copy(scope.MainCtrl.msgs)
    scope.MainCtrl.addMsg('success', 'Foo')
    msgsAfter = angular.copy(scope.MainCtrl.msgs)

    expect(msgsAfter.length).toBeGreaterThan(msgsBefore)
    expect(msgsAfter[0]).toEqual({style: 'success', text: 'Foo'})
