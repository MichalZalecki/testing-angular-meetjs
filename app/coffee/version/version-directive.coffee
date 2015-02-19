'use strict'

angular.module 'version.version-directive', []

.directive 'version', [ 'version', (version) ->
  restrict: 'A',
  link: (scope, iElement, iAttrs) ->
    iElement.text("Anguloffee #{version}")
]