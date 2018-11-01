require 'selenium-webdriver'
class BasePage
  def initialize
    @driver=driver
  end
  def wait(condition, timeout)
    wait = Selenium::WebDriver::Wait.new(timeout: timeout)
    wait.until { condition } #{ driver.find_element(id: "cheese").displayed? }
  end

  private
  def driver
    options=Selenium::WebDriver::Chrome::Options.new
    options.add_argument('--incognito')
    chromeDriver=Selenium::WebDriver.for :chrome, options:options
    chromeDriver.manage.window.maximize
    return chromeDriver
  end

end