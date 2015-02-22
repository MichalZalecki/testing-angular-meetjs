screenshot = require './screenshot'
screenshot.config.path = 'e2e-tests/screenshots/'

describe 'meet.js Wrocław', ->

  title = element(By.css('h1'))

  describe 'homepage', ->

    alerts = messages = textfield = btnSuccess = btnInfo = btnWarning = btnDanger = null

    beforeEach ->
      browser.get 'http://localhost:8080/app/'

      alerts = element.all(By.css('.alert'))
      messages = element.all(By.repeater('(index, msg) in msgs'))

      textfield = element(By.model("alert.msg"))
      btnSuccess = element(By.css(".btn-success"))
      btnInfo = element(By.css(".btn-info"))
      btnWarning = element(By.css(".btn-warning"))
      btnDanger = element(By.css(".btn-danger"))

      afterEach ->
        screenshot.take(jasmine.getEnv().currentSpec, true)

    it 'should have a title', ->
      expect(browser.getTitle()).toEqual 'meet.js Wrocław'
      expect(title.getText()).toEqual 'meet.js Wrocław'

    it 'should have one alert which is info and can be closed', ->
      expect(alerts.count()).toEqual 1

      alert = alerts.first()
      expect(alert.getAttribute('class')).toEqual 'alert alert-info'
      expect(alert.getText()).toContain 'Hello meet.js Wrocław!'

      alert.element(By.css('.close')).click()
      expect(alerts.count()).toEqual 0

    it 'should be able to add and remove messages', ->
      textfield.clear().sendKeys 'Success message'
      btnSuccess.click()
      expect(messages.last().getText()).toContain 'Success message'

      textfield.clear().sendKeys 'Info message'
      btnInfo.click()
      expect(messages.last().getText()).toContain 'Info message'

      textfield.clear().sendKeys 'Warning message'
      btnWarning.click()
      expect(messages.last().getText()).toContain 'Warning message'

      textfield.clear().sendKeys 'Danger message'
      btnDanger.click()
      expect(messages.last().getText()).toContain 'Danger message'

      expect(alerts.count()).toEqual 5
      expect(messages.count()).toEqual 4

      messages.each (elem) ->
        elem.element(By.css('.close')).click()

      expect(alerts.count()).toEqual 1
      expect(messages.count()).toEqual 0

  describe 'GitHub Repos', ->

    textfield = btnGit = repos = msg = null

    beforeEach ->
      browser.get 'http://localhost:8080/app/#/github-repos'

      textfield = element(By.model("user.name"))
      btnGit = element(By.css(".btn-default"))
      repos = element.all(By.repeater('repo in repos'))
      msg = element(By.exactBinding('msg'))

    it 'should have a title', ->
      expect(title.getText()).toEqual 'GitHub Repos'

    it 'should be able to find user repos and set appropriate message', ->
      textfield.clear().sendKeys 'MichalZalecki'
      btnGit.click()
      browser.waitForAngular()
      # expect resolve promise under the hood
      expect(repos.count()).toBeGreaterThan(0)
      # when we need count as number
      repos.count().then (count) ->
        expect(element(By.css('h2')).getText()).toEqual "Found #{count} repos"

    it 'should be able to react if user not found', ->
      # Do you know why there is no user "blog" (and won't be)?
      textfield.clear().sendKeys 'blog'
      btnGit.click()
      browser.waitForAngular()
      expect(repos.count()).toEqual 0
      expect(msg.getText()).toEqual 'Not Found'

  describe 'Moment.js', ->

    beforeEach ->
      browser.get 'http://localhost:8080/app/#/moment'

    it 'should have a title', ->
      expect(title.getText()).toEqual 'Moment.js'

    it 'should not have invalid dates', ->
      expect(element.all(By.css('h3')).getText()).not.toContain 'Invalid date'