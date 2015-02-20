'use strict'

angular.module 'partial-controllers.home', []

.controller 'HomeCtrl', [ '$scope', ($scope) ->
  $scope.alert = {}
  $scope.addAlert = (style) ->
    $scope.addMsg(style, $scope.alert.msg)
    $scope.alert = {}
    $scope.alertform.$setPristine()
]
