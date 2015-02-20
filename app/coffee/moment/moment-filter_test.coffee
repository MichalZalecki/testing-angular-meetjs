'use strict'

describe 'momentFilter', ->

  $filter = null

  beforeEach module 'moment'
  beforeEach inject (_$filter_) ->
    $filter = _$filter_

  it 'should have default DD-MM-YYYY format', ->
    expect($filter('moment')('2015-02-23', 'YYYY-MM-DD'))
      .toEqual('23-02-2015')

  it 'should work with custom formats', ->
    expect($filter('moment')('2015-02-23 10:35', 'YYYY-MM-DD H:mm', 'Ha, Do MMM YY'))
      .toEqual('10am, 23rd Feb 15')

    expect($filter('moment')('2015-02-23', 'YYYY-MM-DD', 'Q'))
    .toEqual('1')