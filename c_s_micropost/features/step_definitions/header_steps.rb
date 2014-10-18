# encoding: utf-8

Given(/^user logout$/) do
	header_module.logout
end


Given (/^visit (?:login|signin) page$/) do
	header_module.access_login_page
end


Given(/^visit send page$/) do
  	header_module.access_send_page
end


Given(/^visit home page$/) do
	header_module.access_home_page
end


Given(/^visit users page$/) do
	header_module.access_users_page
end


Given(/^visit profile page$/) do
	header_module.access_self_profile_page
end






