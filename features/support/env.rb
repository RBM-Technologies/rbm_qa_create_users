require 'rubygems'
require 'capybara'
require 'capybara/cucumber'

Capybara.configure do |config|
  config.default_driver = :selenium
  config.app_host   = 'https://www.tmobile-vmm-uat.aws.rbmtechnologies.com/view/login'
end
World(Capybara)
