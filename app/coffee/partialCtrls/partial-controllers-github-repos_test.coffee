'use strict'

describe 'GitHubReposCtrl', ->

  GitHubReposCtrl = GitHubReposMock = scope = null

  beforeEach module 'partial-controllers.github-repos'
  beforeEach inject ($rootScope, $controller, $q) ->
    scope = $rootScope.$new();

    GitHubReposMock =
      ofUser: () -> $q (resolve) ->
        resolve ['Repo 1', 'Repo 2' , 'Repo 3']

    GitHubReposCtrl = $controller 'GitHubReposCtrl',
      '$scope': scope
      GitHubRepos: GitHubReposMock

    spyOn(GitHubReposMock, 'ofUser').and.callThrough();

    scope.$digest()

  it 'should set several initial values', ->
    scope.user.name = 'Foo'
    expect(scope.user).toEqual {name: 'Foo'}
    expect(scope.repos).toEqual []
    expect(scope.msg).toEqual ''

  it 'should have getRepos method', ->
    expect(scope.getRepos).toEqual jasmine.any Function

  it 'should call GitHubRepos.ofUser with user.name through getRepos', ->
    scope.user.name = 'Bar'
    scope.getRepos()
    expect(GitHubReposMock.ofUser).toHaveBeenCalledWith('Bar')

  it 'should have repos and msg after getRepos call', ->
    scope.$apply () ->
      scope.getRepos()

    expect(scope.repos).toEqual ['Repo 1', 'Repo 2' , 'Repo 3']
    expect(scope.msg).toEqual 'Found 3 repos'