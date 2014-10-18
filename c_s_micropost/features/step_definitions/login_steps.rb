
Given(/^user login$/) do
	login_page.login login_d.r_email, login_d.r_password
end


Given(/^non\-administrator login$/) do
	login_page.login(user_d.user_email, user_d.user_password)
end


Given(/^administrator login$/) do
	login_page.login(user_d.admin_email, user_d.admin_password)
end


When(/^input (.*?) and (.*?) with commit$/) do |email, passwd|
	login_page.login email, passwd 
end


When (/^input wrong with commit$/) do
	login_page.login login_d.w_email, login_d.w_password 
end


When (/^input right with commit$/) do
	login_page.login login_d.r_email, login_d.r_password 
end


Then (/^verify login_faild$/) do
	expect( login_page.verify_login_error_msg ).to eql login_d.login_error_msg 
	expect( login_page.match_error_msg login_d.login_error_msg ).to be true
	# 截屏
	# expect( login_page.verify_login_error_msg login_d.save_path.error ).to eql login_d.login_error_msg 
	# expect( login_page.match_error_msg(login_d.login_error_msg, login_d.save_path.error) ).to be true
end


Then (/^verify login_success$/) do
	expect( profile_page.verify_title login_d.profile_page_title ).to be true
	expect( profile_page.verify_text login_d.text ).to be true
	expect( profile_page.match_name login_d.name ).to be true
	# 截屏
	# expect( profile_page.verify_text(login_d.text, login_d.save_path.text) ).to be true
	# expect( profile_page.match_name(login_d.name, login_d.save_path.name) ).to be true	
end


Then(/^verify signin page title is right$/) do
	expect(login_page.verify_title(link_d.signin_title)).to be true
end


Then(/^verify unlogin error$/) do
	expect( login_page.verify_unlogin_error_msg ).to eq user_d.unlogin_error_msg
	# expect( login_page.verify_unlogin_error_msg(user_d.save_path.unlogin_error_msg) ).to eq user_d.unlogin_error_msg 
end




