'use strict'

describe 'HomeCtrl', ->

  HomeCtrl = scope = null

  beforeEach module 'partial-controllers.home'
  beforeEach inject ($rootScope, $controller) ->
    scope = $rootScope.$new()
    scope.addMsg = () ->
      return
    scope.alertform =
      $setPristine: () ->

    HomeCtrl = $controller 'HomeCtrl',
      '$scope': scope

    scope.$digest()
    spyOn(scope, 'addMsg')
    spyOn(scope.alertform, '$setPristine')

  it 'should set initial value', ->
    expect(scope.alert).toEqual {}

  it 'should have addAlert method', ->
    expect(scope.addAlert).toEqual jasmine.any Function

  it 'should call addMsg with style and alert.msg through addAlert', ->
    scope.alert.msg = 'Bar'
    scope.addAlert('success')
    expect(scope.addMsg).toHaveBeenCalledWith('success', 'Bar')

  it 'should call alertform.$setPrisitne and reset alert through addAlert', ->
    scope.alert.msg = 'FooBar'
    expect(scope.alert).toEqual {msg: 'FooBar'}
    scope.addAlert('success')
    expect(scope.alert).toEqual {}
    expect(scope.alertform.$setPristine).toHaveBeenCalled()