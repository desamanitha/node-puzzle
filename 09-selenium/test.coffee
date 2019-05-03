assert = require 'assert'
test = require 'selenium-webdriver/testing'
webdriver = require 'selenium-webdriver'


test.describe 'Adslot website', ->

  # Browser (or driver) instance
  browser = null

  # Init browser before we begin
  test.before -> browser = new webdriver.Builder().usingServer().withCapabilities({browserName: 'chrome'}).build()

  # Close browser after all tests
  test.after -> browser.quit()

  test.describe 'Adslot careers' , ->

    test.it 'should have 8 offices on careers page', ->

      browser.get 'http://adslot.com/careers'

      browser.findElements(webdriver.By.css('.ui-tabs-nav h4, .ui-tabs-nav h2')).then (menuItems) ->
        assert menuItems.length, 8


  test.describe 'Adslot Contact Us' , ->

    test.it 'should contain three tabs on "contact us" page', ->

      browser.get 'http://www.adslot.com/contact-us'
      browser.findElement(webdriver.By.xpath('//span[.="Request a Demo"]')).isDisplayed()
      browser.findElement(webdriver.By.xpath('//span[.="Contact Sales"]')).isDisplayed()
      browser.findElement(webdriver.By.xpath('//span[.="Book a Webinar"]')).isDisplayed()

    test.it 'should display the form fields of REQUEST A DEMO tab' , ->
      # Observed that all element names static. So using locator name.
      browser.findElement(webdriver.By.name('input_1')).isDisplayed()
      browser.findElement(webdriver.By.name('input_2')).isDisplayed()
      browser.findElement(webdriver.By.name('input_3')).isDisplayed()
      browser.findElement(webdriver.By.name('input_4')).isDisplayed()
      browser.findElement(webdriver.By.name('input_5')).isDisplayed()
      browser.findElement(webdriver.By.name('input_6')).isDisplayed()
      browser.findElement(webdriver.By.name('input_8')).isDisplayed()
      browser.findElement(webdriver.By.css('input[type=submit]')).isDisplayed()

    test.it 'should check for the type of fields on the REQUEST A DEMO form' , ->

      browser.findElement(webdriver.By.name('input_1')).getAttribute('type').then((type) -> assert.equal(type, 'text'))
      browser.findElement(webdriver.By.name('input_2')).getAttribute('type').then((type) -> assert.equal(type, 'text'))
      browser.findElement(webdriver.By.name('input_3')).getAttribute('type').then((type) -> assert.equal(type, 'text'))
      browser.findElement(webdriver.By.name('input_4')).getAttribute('type').then((type) -> assert.equal(type, 'text'))
      browser.findElement(webdriver.By.name('input_5')).getAttribute('type').then((type) -> assert.equal(type, 'text'))
      browser.findElement(webdriver.By.name('input_6')).getAttribute('type').then((type) -> assert.equal(type, 'select-one'))
      browser.findElement(webdriver.By.name('input_8')).getAttribute('type').then((type) -> assert.equal(type, 'text'))
      browser.findElement(webdriver.By.css('input[type=submit]')).getAttribute('type').then((type) -> assert.equal(type,'submit'))

  test.describe 'search Adslot in google' , ->

    test.it 'open google page' , ->

      browser.get 'http://google.com'

    test.it 'should search for Adslot in google' , ->

      browser.findElement(webdriver.By.name('q')).sendKeys('Adslot')
      browser.findElement(webdriver.By.name('q')).sendKeys(webdriver.Key.ENTER)

    test.it 'should click on the first link in the search result' , ->

      browser.findElement(webdriver.By.xpath('//*[@id="rso"]/div[1]/div/div/div/div/div[1]/a/h3')).click()

    test.it 'should match with the Adslot page title' , ->

      browser.getTitle().then((title) -> assert.equal(title,'Adslot'))

  test.describe 'Adslot website' , ->

    test.it 'open adslot homepage' , ->

      browser.get 'http://adslot.com/'

    test.it 'should click on Request a Demo link on homepage' , ->

      reqDemoButLocator = webdriver.By.linkText('Request a Demo')
      reqDemoBut = browser.isElementPresent(reqDemoButLocator)
      reqDemoBut.then(() ->
        browser.findElement(reqDemoButLocator).click())

    test.it 'should navigate to Contact Us page' , ->

       browser.getTitle().then((title) -> assert.equal(title,'Contact Us | Adslot.'))

