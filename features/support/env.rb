require 'capybara/cucumber'
require 'capybara-screenshot/cucumber'
require 'capybara/rspec'
require 'selenium-webdriver'
require 'rspec/retry'
require 'pry'
require 'securerandom'
require 'yaml'
require 'dotenv'
require 'site_prism'

Dotenv.load

Capybara.app_host = 'https://www.salestockindonesia.com'
Capybara.default_driver = :selenium

Capybara.default_max_wait_time = 2

Capybara::Screenshot.autosave_on_failure = true
Capybara::Screenshot.webkit_options = { width: 1300, height: 768 }
Capybara.save_path = "screenshots"

Capybara.register_driver :selenium do |app|
  profile = Selenium::WebDriver::Firefox::Profile.new
  client = Selenium::WebDriver::Remote::Http::Default.new
  client.timeout = 120 
  Capybara::Selenium::Driver.new(app, http_client: client)
end

Before do
  page.driver.browser.manage.window.resize_to(1300, 768)
end

After do |scenario|
  if scenario.failed?
    puts("ERROR REPORT")
    url = URI.parse(current_url)
    puts("URL = " + url.to_s)
  end
end
