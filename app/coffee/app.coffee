'use strict'

angular.module 'myApp', [
  'ui.router'
  'partial-controllers'
  'version'
  'github-repos'
  'moment'
  'message'
]

.controller 'myAppCtrl',  [ '$scope', 'appName', ($scope, appName) ->
  $scope.appName = appName;
  $scope.msgs = []
  $scope.addMsg = (style, text) ->
    $scope.msgs.push {style: style, text: text}
  $scope.removeMsg = (id) ->
    # console.log "Close message #{id}"
    $scope.msgs.splice(id, 1)
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