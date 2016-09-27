# require 'rubygems'
# require 'capybara'
# require 'capybara/cucumber'

# Capybara.configure do |config|
#   config.default_driver = :selenium
#   config.app_host   = 'https://www.tmobile-vmm-uat.aws.rbmtechnologies.com/view/login'
# end
# World(Capybara)

begin require 'rspec/expectations'; rescue LoadError; require 'spec/expectations'; end
require 'capybara'
require 'capybara/dsl'
require 'capybara/cucumber'
require 'capybara-webkit'
require 'csv'
require 'launchy'
require 'pry'

Capybara.default_driver = :webkit
Capybara.javascript_driver = :webkit
