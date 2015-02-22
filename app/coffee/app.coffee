'use strict'

angular.module 'app', [
  'ui.router'
  'partial-controllers'
  'version'
  'github-repos'
  'moment'
  'message'
]

.controller 'MainCtrl',  [ '$scope', 'appName', ($scope, appName) ->
  $scope.MainCtrl = {}
  $scope.MainCtrl.appName = appName;
  $scope.MainCtrl.msgs = []

  $scope.MainCtrl.addMsg = (style, text) ->
    $scope.MainCtrl.msgs.push {style: style, text: text}

  $scope.MainCtrl.removeMsg = (index) ->
    $scope.MainCtrl.msgs.splice(index, 1)
]

.constant 'appName', 'meet.js Wrocław'

.config ['$urlRouterProvider', '$stateProvider', ($urlRouterProvider, $stateProvider) ->

  $urlRouterProvider.otherwise('/')

  $stateProvider
    .state 'home',
      url: '/'
      templateUrl: 'partials/home.html'
      controller: 'HomeCtrl'

    .state 'github-repos',
      url: '/github-repos'
      templateUrl: 'partials/github-repos.html'
      controller: 'GitHubReposCtrl'

    .state 'moment',
      url: '/moment'
      templateUrl: 'partials/moment.html'
]
