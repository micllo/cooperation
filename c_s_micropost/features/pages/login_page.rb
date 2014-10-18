require File.expand_path'features/dialogs/login_dialog'

class LoginPage < BasePage

	include Login_Dialog

	#【 action 】

	def login email, password
		header_module.access_login_page
		email_field.send_keys email
		password_field.send_keys password 
		sleep 1
		login_button.click
	end


	#【 verify 】

	def verify_unlogin_error_msg path = false
		unlogin_error_msg(path).text
	end

	def verify_login_error_msg path = false
		login_error_msg(path).text
	end
	
	def match_error_msg msg, path = false
		# if get_login_error_msg.text =~ /(.*)#{msg}(.*)/
		match_result = /(.*)#{msg}(.*)/.match verify_login_error_msg(path)
		if match_result
			# puts "显示全部匹配的字符串：#{match_result}"
			# puts "显示第1和第2分组中匹配的字符串: #{match_result[1,2]}" 
			return true
		else
			return false
		end
	end

end













