# encoding: utf-8


Given(/^acquire following num$/) do
	profile_page.acquire_following_num
end


Then(/^verify (?:profile|view_my_profile) page title is right$/) do
	expect(profile_page.verify_title(link_d.profile_title)).to be true
end


Then(/^verify following num is increase$/) do
	expect( profile_page.verify_following_num_increase ).to be true
end


Then(/^verify following num is reduce$/) do
	expect( profile_page.verify_following_num_reduce ).to be true
end




