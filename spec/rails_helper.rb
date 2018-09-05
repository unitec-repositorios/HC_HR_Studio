# This file is copied to spec/ when you run 'rails generate rspec:install's
require 'spec_helper'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort("The Rails environment is running in production mode!") if Rails.env.production?
require 'rspec/rails'
require 'capybara/rspec'
require 'capybara/rails'
require 'selenium-webdriver'

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  config.include Capybara::DSL
  #Register driver
  WEBDRIVER_HUB_URL = "http://127.0.0.1:4444/wd/hub"
  Capybara.register_driver :remote_chrome do |app|
    caps = Selenium::WebDriver::Remote::Capabilities.chrome(:chromeOptions => {"args" => [ "--disable-web-security" ]})
    opts   = {
      :browser     => :remote,
      :url         => WEBDRIVER_HUB_URL, 
    :desired_capabilities => caps
    }
    Capybara::Selenium::Driver.new(app, opts)
  end
  # Configure Capybara
  Capybara.configure do |config|
    config.default_driver         = :remote_chrome
    config.javascript_driver      = :remote_chrome
  end
end
