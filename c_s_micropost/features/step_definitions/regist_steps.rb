# encoding: utf-8


When(/^input name_blank with commit$/) do
  	regist_page.regist('', '', '', '')
end
Then(/^verify regist_faild_with_name_blank$/) do
	expect(regist_page.name_blank_error).to eql regist_d.name_blank
	# expect(regist_page.name_blank_error regist_d.save_path.name_blank).to eql regist_d.name_blank  
end


When(/^input name_too_long with commit$/) do
	regist_page.regist(regist_d.w_name,'', '' , '')
end
Then(/^verify regist_faild_with_name_too_long$/) do
	expect(regist_page.name_too_long_error).to eql regist_d.name_too_long
	# expect(regist_page.name_too_long_error regist_d.save_path.name_too_long).to eql regist_d.name_too_long
end


When(/^input email_blank with commit$/) do
	regist_page.regist(regist_d.r_name,'', '' , '')
end
Then(/^verify regist_faild_with_email_blank$/) do
	expect(regist_page.email_blank_error).to eql regist_d.email_blank
	# expect(regist_page.email_blank_error data.save_path.email_blank).to eql data.email_blank
end


When(/^input email_invalid with commit$/) do
	regist_page.regist(regist_d.r_name, regist_d.w_email, '', '')
end
Then(/^verify regist_faild_with_email_invalid$/) do
	expect(regist_page.email_invalid_error).to eql regist_d.email_invalid
	# expect(regist_page.email_invalid_error data.save_path.email_invalid).to eql data.email_invalid
end


When(/^input passwd_blank with commit$/) do
	regist_page.regist(regist_d.r_name, config.r_email, '', '')
end
Then(/^verify regist_faild_with_passwd_blank$/) do
	expect(regist_page.password_blank_error).to eql regist_d.password_blank
	# expect(regist_page.password_blank_error data.save_path.password_blank).to eql data.password_blank
end


When(/^input passwd_too_short with commit$/) do
	regist_page.regist(regist_d.r_name, config.r_email, regist_d.w_password, '')
end
Then(/^verify regist_faild_with_passwd_too_short$/) do
	expect(regist_page.password_too_short_error).to eql regist_d.password_too_short
	# expect(regist_page.password_too_short_error data.save_path.password_too_short).to eql data.password_too_short
end


When(/^input passwd_no_match with commit$/) do
	regist_page.regist(regist_d.r_name, config.r_email, regist_d.r_password, regist_d.w_password)
end
Then(/^verify regist_faild_with_passwd_no_match$/) do
	expect(regist_page.password_no_match_error).to eql regist_d.password_no_match
	# expect(regist_page.password_no_match_error data.save_path.password_no_match).to eql data.password_no_match
end


When(/^input email_has_regist with commit$/) do
	regist_page.regist(regist_d.r_name, regist_d.w_email_had, regist_d.r_password, regist_d.r_password)
end
Then(/^verify regist_faild_with_email_has_regist$/) do
	expect(regist_page.email_has_regist_error).to eql regist_d.email_has_regist
	# expect(regist_page.email_has_regist_error data.save_path.email_has_regist).to eql data.email_has_regist
end


When(/^input all_right with commit$/) do
	regist_page.regist(regist_d.r_name, config.r_email, regist_d.r_password, regist_d.r_password)
end
Then(/^verify regist_success$/) do
	expect(profile_page.verify_regist_success).to eql regist_d.regist_success_msg
	# expect(profile_page.verify_regist_success data.save_path.regist_success_msg).to eql data.regist_success_msg
end





