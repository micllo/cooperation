# encoding: utf-8


Given(/^visit other_profile page$/) do
	users_page.access_first_profile_page
end


When(/^delete first user in fourth paging$/) do
	users_page.delete_first_user_in_fourth_paging
end


Then(/^verify delete successful$/) do
	expect(users_page.verify_delete_success_msg).to eq(user_d.delete_success_msg)
end


Then(/^verify users page title is right$/) do
	expect(users_page.verify_title(link_d.users_title)).to be true
end


Then(/^verify he cannot delete other user$/) do
	expect(users_page.verify_delete_exist_or_not).to be false
end


Then(/^verify he can delete other user$/) do
	expect(users_page.verify_delete_exist_or_not).to be true
end


Then(/^verify users num is reduce with delete first user in fourth paging$/) do
	expect { users_page.delete_first_user_in_fourth_paging }.to change{ users_page.li_of_user_list.count }.by(-1)
end





