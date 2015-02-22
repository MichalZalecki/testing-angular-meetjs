'use strict'

angular.module 'partial-controllers.home', []

.controller 'HomeCtrl', [ '$scope', ($scope) ->
  $scope.HomeCtrl = {}
  $scope.HomeCtrl.alert = {}
  $scope.HomeCtrl.addAlert = (style) ->
    $scope.MainCtrl.addMsg(style, $scope.HomeCtrl.alert.msg)
    $scope.HomeCtrl.alert = {}
    $scope.alertform.$setPristine()
]
