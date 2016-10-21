Given(/^I print in the terminal Hello World$/) do
  puts "Hello World!!!"
end

Given(/^my name is "(.*?)"$/) do |name|
  puts name
end

When(/^my last name is "([^"]*)"$/) do |last_name|
  puts last_name
end

When (/^I open the "([^"]*)" in a browser$/) do |url|
  @browser.navigate.to url
end

When(/^I search for "([^"]*)" in google search$/) do |search_term|
  @browser.find_element(:id, "gbqfq").send_keys search_term
end

Then(/^I click on a search button$/) do
  @browser.find_element(:id, "gbqfb").click
end

When(/^I click on Sign in button$/) do
  @browser.find_element(:id, "gb_70").click
end

When(/^I type my email "([^"]*)" and password "([^"]*)"$/) do |login, password|
  @browser.find_element(:id, "Email").send_keys login
  @browser.find_element(:id, "Passwd").send_keys password
end

When(/^I click on Sign in button on login page$/) do
  @browser.find_element(:id, "signIn").click
end

Then(/^I will see "([^"]*)" in signed section$/) do |email|
  @browser.find_element(:css, "a.gb_q.gb_O.gb_j.gb_K").text.should == email
end
