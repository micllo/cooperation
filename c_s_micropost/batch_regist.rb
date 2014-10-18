# encoding:utf-8
require 'selenium-webdriver'
require 'rspec'
require 'yaml'
Dir['features/pages/*.rb'].each{ |file| require File.expand_path file }
require File.expand_path'features/support/method_helper'
include Method_Helper

driver = Selenium::WebDriver.for :chrome
base_page = BasePage.new(driver)
url = 'http://localhost:3000'
base_page.open_url url

# 批量注册
name = 'shabi'
num = 2
base_page.batch_regist(name, num)



driver.close







