'use strict'

describe 'momentFilter', ->

  beforeEach module 'moment'

  it 'should have default DD-MM-YYYY format', inject ($filter) ->
    expect($filter('moment')('2015-02-23', 'YYYY-MM-DD'))
      .toEqual('23-02-2015')

  it 'should work with custom formats', inject ($filter) ->
    expect($filter('moment')('2015-02-23 10:35', 'YYYY-MM-DD H:mm', 'Ha, Do MMM YY'))
      .toEqual('10am, 23rd Feb 15')

    expect($filter('moment')('2015-02-23', 'YYYY-MM-DD', 'Q'))
      .toEqual('1')