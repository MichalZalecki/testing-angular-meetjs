'use strict'

angular.module 'partial-controllers.github-repos', []

.controller 'GitHubReposCtrl', [ '$scope', 'GitHubRepos', ($scope, GitHubRepos) ->
  $scope.GitHubReposCtrl = {}
  $scope.GitHubReposCtrl.user = {}
  $scope.GitHubReposCtrl.repos = []
  $scope.GitHubReposCtrl.msg = ''

  $scope.GitHubReposCtrl.getRepos = () ->
    GitHubRepos.ofUser($scope.GitHubReposCtrl.user.name)
      .then (repos) ->
        $scope.GitHubReposCtrl.repos = repos
        $scope.GitHubReposCtrl.msg = "Found #{repos.length} repos"
      , (err) ->
        $scope.GitHubReposCtrl.repos = []
        $scope.GitHubReposCtrl.msg = err
]
