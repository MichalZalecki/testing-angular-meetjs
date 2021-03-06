// Generated by CoffeeScript 1.9.0
(function() {
  'use strict';
  describe('GitHubReposCtrl', function() {
    var GitHubReposCtrl, GitHubReposMock, scope;
    GitHubReposCtrl = GitHubReposMock = scope = null;
    beforeEach(module('partial-controllers.github-repos'));
    beforeEach(inject(function($rootScope, $controller, $q) {
      scope = $rootScope.$new();
      GitHubReposMock = {
        ofUser: function() {
          return $q(function(resolve) {
            return resolve(['Repo 1', 'Repo 2', 'Repo 3']);
          });
        }
      };
      GitHubReposCtrl = $controller('GitHubReposCtrl', {
        '$scope': scope,
        GitHubRepos: GitHubReposMock
      });
      spyOn(GitHubReposMock, 'ofUser').and.callThrough();
      return scope.$digest();
    }));
    it('should set several initial values', function() {
      scope.GitHubReposCtrl.user.name = 'Foo';
      expect(scope.GitHubReposCtrl.user).toEqual({
        name: 'Foo'
      });
      expect(scope.GitHubReposCtrl.repos).toEqual([]);
      return expect(scope.GitHubReposCtrl.msg).toEqual('');
    });
    it('should have getRepos method', function() {
      return expect(scope.GitHubReposCtrl.getRepos).toEqual(jasmine.any(Function));
    });
    it('should call GitHubRepos.ofUser with user.name through getRepos', function() {
      scope.GitHubReposCtrl.user.name = 'Bar';
      scope.GitHubReposCtrl.getRepos();
      return expect(GitHubReposMock.ofUser).toHaveBeenCalledWith('Bar');
    });
    return it('should have repos and msg after getRepos call', function() {
      scope.$apply(function() {
        return scope.GitHubReposCtrl.getRepos();
      });
      expect(scope.GitHubReposCtrl.repos).toEqual(['Repo 1', 'Repo 2', 'Repo 3']);
      return expect(scope.GitHubReposCtrl.msg).toEqual('Found 3 repos');
    });
  });

}).call(this);
