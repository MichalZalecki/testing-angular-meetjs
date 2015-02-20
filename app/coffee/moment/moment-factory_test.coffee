'use strict'

describe 'moment', ->

  beforeEach module 'moment.moment-factory'

  it 'should be moment.js', inject (moment) ->
    expect(moment).toEqual jasmine.any Function
    expect(moment).toEqual window.moment