## Installation
1. install Ruby
2. Library
    - gem install selenium-webdriver
    - gem install cucumber
    - gem install rspec
3. enter to project
4. type cucumber

## API User Agent
require 'httparty'

APPLICATION_NAME = "Httparty"
response = HTTParty.get('http://example.com', headers: {"User-Agent" => APPLICATION_NAME})
