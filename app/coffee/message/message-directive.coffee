'use strict'

angular.module 'message.message-directive', []

.directive 'message', ['$timeout', ($timeout) ->
  restrict: 'E'
  transclude: true
  scope: {
    style: '@'
    index: '@'
    fn: '&'
  }
  link: (scope, element, attr) ->
    scope.close = () ->
      if attr.fn? and attr.index?
        scope.fn({index: scope.index})
      else
        element.remove()
        scope.$destroy()

    # $timeout scope.close, 5000

  template:
    '<div class="alert alert-{{ style }}" role="alert">' +
      '<button type="button" class="close" ng-click="close()"><span>&times;</span></button>' +
      '<span ng-transclude></span>' +
    '</div>'
]
