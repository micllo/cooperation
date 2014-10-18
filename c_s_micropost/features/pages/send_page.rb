# encoding:utf-8
require File.expand_path'features/dialogs/send_dialog'

class SendPage < BasePage

	include Send_Dialog

	#【 action 】

	def send_micropost context
		header_module.access_send_page
		micropost_field.send_keys context
		send_button.click
	end

	def visit_my_profile
		view_my_profile_link.click
	end

	def visit_following_page
		following_link.click
	end

	def visit_followers_page
		followers_link.click
	end


	#【 verify 】

	def verify_send_success_msg path = false
		send_success_msg(path).text
	end

end



