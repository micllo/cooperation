# encoding:utf-8
require File.expand_path'features/dialogs/regist_dialog'

class RegistPage < BasePage

	include Regist_Dialog

	#【 action 】

	def regist name, email, password, confirm
		# 清除输入框
		name_field.clear
		email_field.clear
		password_field.clear
		confirm_field.clear
		# 执行注册
		name_field.send_keys name
		email_field.send_keys email 
		password_field.send_keys password 
		confirm_field.send_keys confirm
		sleep 1
		regist_button.click
	end


	#【 verify 】
	
	def name_blank_error path = false
		get_name_blank_error(path).text
	end

	def name_too_long_error path = false
		get_name_too_long_error(path).text
	end

	def email_blank_error path = false
		get_email_blank_error(path).text
	end

	def email_invalid_error path = false
		get_email_invalid_error(path).text
	end

	def password_blank_error path = false
		get_password_blank_error(path).text
	end

	def password_too_short_error path = false
		get_password_too_short_error(path).text
	end

	def password_no_match_error path = false
		get_password_no_match_error(path).text
	end

	def email_has_regist_error path = false
		get_email_has_regist_error(path).text
	end

end


