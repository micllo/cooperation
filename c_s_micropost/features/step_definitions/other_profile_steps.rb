# encoding: utf-8


Given(/^acquire followers num$/) do
	other_profile_page.acquire_followers_num
end


Then(/^verify followers num is increase$/) do
	expect( other_profile_page.verify_followers_num_increase ).to be true
end


Then(/^verify followers num is reduce$/) do
	expect( other_profile_page.verify_followers_num_reduce ).to be true
end


Then(/^verify other_profile page title is right$/) do
	expect(other_profile_page.verify_title(link_d.admin_user_profile_title)).to be true
end


