'use strict'

describe 'HomeCtrl', ->

  HomeCtrl = scope = null

  beforeEach module 'partial-controllers.home'
  beforeEach inject ($rootScope, $controller) ->
    scope = $rootScope.$new()
    scope.MainCtrl = {}
    scope.MainCtrl.addMsg = () ->
      return
    scope.alertform =
      $setPristine: () ->

    HomeCtrl = $controller 'HomeCtrl',
      '$scope': scope

    scope.$digest()
    spyOn(scope.MainCtrl, 'addMsg')
    spyOn(scope.alertform, '$setPristine')

  it 'should set initial value', ->
    expect(scope.HomeCtrl.alert).toEqual {}

  it 'should have addAlert method', ->
    expect(scope.HomeCtrl.addAlert).toEqual jasmine.any Function

  it 'should call addMsg with style and alert.msg through addAlert', ->
    scope.HomeCtrl.alert.msg = 'Bar'
    scope.HomeCtrl.addAlert('success')
    expect(scope.MainCtrl.addMsg).toHaveBeenCalledWith('success', 'Bar')

  it 'should call alertform.$setPrisitne and reset alert through addAlert', ->
    scope.HomeCtrl.alert.msg = 'FooBar'
    expect(scope.HomeCtrl.alert).toEqual {msg: 'FooBar'}
    scope.HomeCtrl.addAlert('success')
    expect(scope.HomeCtrl.alert).toEqual {}
    expect(scope.alertform.$setPristine).toHaveBeenCalled()
