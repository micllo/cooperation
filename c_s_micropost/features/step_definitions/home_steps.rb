# encoding: utf-8


Given(/^visit (?:regist|signup) page$/) do
  	home_page.access_regist_page
end


Given(/^visit new_window page$/) do
	home_page.visit_new_win
end


Then(/^verify (?:home page|page) title is right$/) do
	expect(home_page.verify_title(link_d.home_title)).to be true
end


Then(/^verify sigup page title is right$/) do
	expect(home_page.verify_title(link_d.signup_title)).to be true
end


Then(/^verify new_window page title is right$/) do
	expect(home_page.verify_new_win_title(link_d.new_win_title)).to be true
end



