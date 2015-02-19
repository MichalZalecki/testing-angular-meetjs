describe 'Anguloffee', ->

  beforeEach ->
    browser.get 'http://localhost:8080/app/'

  it 'should have a title', ->
    expect(browser.getTitle())
      .toEqual 'Anguloffee - AngularJS with CoffeeScript starter'

  it 'should display proper version in footer', ->
    expect(element(By.css 'footer').getText()).toContain 'Anguloffee 1.0.0'
