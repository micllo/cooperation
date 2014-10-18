# encoding: utf-8


Given(/^visit view_my_profile page$/) do
	send_page.visit_my_profile
end


Given(/^send micropost$/) do
 	send_page.send_micropost send_d.micropost
end
Then(/^verify send successful$/) do
	expect( send_page.verify_send_success_msg ).to eql send_d.send_success_msg
	# expect( send_page.verify_send_success_msg send_d.save_path.send_success_msg ).to eql send_d.send_success_msg
end



