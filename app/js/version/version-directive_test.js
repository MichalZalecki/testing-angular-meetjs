// Generated by CoffeeScript 1.8.0
(function() {
  'use strict';
  describe('version module', function() {
    beforeEach(module('version'));
    return describe('version directive', function() {
      var element;
      element = null;
      beforeEach(inject(function($compile, $rootScope) {
        element = '<p version></p>';
        return element = $compile(element)($rootScope.$new());
      }));
      return it('should contain name and current version', function() {
        return expect(element.text()).toEqual('Anguloffee 1.0.0');
      });
    });
  });

}).call(this);