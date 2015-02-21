'use strict'

angular.module 'message.message-directive', []

.directive 'message', ->
  restrict: 'E'
  transclude: true
  scope: {
    style: '@'
    index: '@'
    fn: '&'
  }
  link: (scope, element, attr) ->
    console.log(scope.index);
    scope.close = () ->
      if attr.fn? and attr.index?
        # let fn handle the cleaning up
        scope.fn({index: scope.index})
      else
        element.remove()
        # permanently detached from the parent
        scope.$destroy()

  template:
    '<div class="alert alert-{{ style }}" role="alert">' +
      '<button type="button" class="close" ng-click="close()"><span>&times;</span></button>' +
      '<span ng-transclude></span>' +
    '</div>'