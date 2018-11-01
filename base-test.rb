require 'selenium-webdriver'
require 'date'
class BaseTest
  def initialize(driver, url)
    @startTime = Process.clock_gettime(Process::CLOCK_MONOTONIC)
    driver.navigate.to url
    @retryCount=0
  end

  def run(test, driver)
    begin
      test
    rescue
      if(@retryCount>1)
        endTime = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        puts "Total test time: " + endTime - @startTime
        driver.save_screenshot(test.name + '_' + DateTime.now + '.png')
        driver.quit
      else
        @retryCount++
        driver.quit
        retry
      end
    else
      endTime = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      puts "Total test time: " + endTime - @startTime
      driver.quit
    end
  end
end