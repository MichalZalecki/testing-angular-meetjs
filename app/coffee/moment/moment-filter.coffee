'use strict'

angular.module 'moment.moment-filter', []

.filter 'moment', [ 'moment', (moment) ->
  (input, from, to = 'DD-MM-YYYY') ->
    moment(input, from).format(to)
]