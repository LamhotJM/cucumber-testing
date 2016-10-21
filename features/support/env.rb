require "selenium-webdriver"
require "rspec"

Before do
  @browser = Selenium::WebDriver.for :chrome
end

After do
  @browser.quit
end