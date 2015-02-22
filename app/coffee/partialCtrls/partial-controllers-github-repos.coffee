'use strict'

angular.module 'partial-controllers.github-repos', []

.controller 'GitHubReposCtrl', [ '$scope', 'GitHubRepos', ($scope, GitHubRepos) ->
  $scope.user = {}
  $scope.repos = []
  $scope.msg = ''

  $scope.getRepos = () ->
    GitHubRepos.ofUser($scope.user.name)
      .then (repos) ->
        $scope.repos = repos
        $scope.msg = "Found #{repos.length} repos"
      , (err) ->
        $scope.repos = []
        $scope.msg = err
]
