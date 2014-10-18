require 'selenium-webdriver'
require 'rspec'
require 'yaml'
require 'ostruct'
Dir['features/pages/*.rb'].each{ |file| require File.expand_path file }
require File.expand_path'features/support/method_helper'
include Method_Helper
require File.expand_path 'features/support/jquery_helper'
include JqueryHelper
# jquery for mouse_hover
# require 'win32ole'



#【 统 计 代 码 覆 盖 率 】
require 'simplecov'
SimpleCov.start
















