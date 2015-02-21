'use strict'

describe 'GitHubReposService', ->

  $httpBackend = GitHubRepos = null

  beforeEach module 'github-repos.github-repos-service'
  beforeEach inject ($injector) ->
    $httpBackend = $injector.get('$httpBackend')
    GitHubRepos = $injector.get('GitHubRepos')

  afterEach ->
    $httpBackend.verifyNoOutstandingExpectation()
    $httpBackend.verifyNoOutstandingRequest()

  it 'should be resolved with list of repos of user', () ->

    $httpBackend
      .expect 'GET', 'https://api.github.com/users/MichalZalecki/repos'
      .respond [
        {id: 28694221, name: 'Repo 1'},
        {id: 28694222, name: 'Repo 2'},
        {id: 28694283, name: 'Repo 3'},
      ]

    GitHubRepos.ofUser("MichalZalecki")
      .then (repos) ->
        expect(repos).toEqual ['Repo 1', 'Repo 2', 'Repo 3']
    $httpBackend.flush()

  it 'should be rejected with "Not Found"', () ->

    $httpBackend
      .expect 'GET', 'https://api.github.com/users/MichalZalecki/repos'
      # function([status,] data[, headers, statusText]
      .respond 404, undefined, undefined, "Not Found"

    GitHubRepos.ofUser("MichalZalecki")
      .then undefined, (err) ->
        expect(err).toEqual "Not Found"
    $httpBackend.flush()