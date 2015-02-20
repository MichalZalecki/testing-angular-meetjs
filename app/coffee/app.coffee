'use strict'

angular.module 'myApp', [
  'ui.router'
  'partial-controllers'
  'version'
  'github-repos'
  'moment'
]

.controller 'myAppCtrl',  [ '$scope', ($scope) ->
  $scope.msgs = []
  $scope.addMsg = (style, text) ->
    $scope.msgs.push {style: style, text: text}
]

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