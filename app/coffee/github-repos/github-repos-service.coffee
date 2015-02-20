'use strict'

angular.module 'github-repos.github-repos-service', []

.service 'GitHubRepos', ['$http', '$q', class GitHubRepos
  constructor: (@$http, @$q) ->
  ofUser: (username) -> @$q (resolve, reject) =>
    @$http.get("https://api.github.com/users/#{username}/repos").then (result) ->
        resolve result.data.map (repo) -> repo.name
      , (err) ->
        reject err.statusText
]