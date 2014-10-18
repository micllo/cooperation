# encoding:utf-8

module Regist_Dialog

	#【 action 】

	def name_field
		wait_for_location(:id ,'user_name')
	end

	def email_field
		location(:id, 'user_email')
	end

	def password_field
		location(:id, 'user_password')
	end

	def confirm_field
		location(:id, 'user_password_confirmation')
	end

	def regist_button
		location(:name, 'commit')
	end


	#【 verify 】

	def get_name_blank_error path
		e = wait_for_location(:xpath, "//div[@id='error_explanation']/ul/li[1]")
		screenshot path
		e
	end

	def get_name_too_long_error path
		e = wait_for_location(:xpath, "//div[@id='error_explanation']/ul/li[1]")
		screenshot path
		e
	end

	def get_email_blank_error path
		e = wait_for_location(:xpath, "//div[@id='error_explanation']/ul/li[2]")
		screenshot path
		e
	end

	def get_email_invalid_error path
		e = wait_for_location(:xpath, "//div[@id='error_explanation']/ul/li[2]")
		screenshot path
		e
	end

	def get_password_blank_error path
		e = wait_for_location(:xpath, "//div[@id='error_explanation']/ul/li[2]")
		screenshot path
		e
	end

	def get_password_too_short_error path
		e = wait_for_location(:xpath, "//div[@id='error_explanation']/ul/li[1]")
		screenshot path
		e
	end

	def get_password_no_match_error path
		e = wait_for_location(:xpath, "//div[@id='error_explanation']/ul/li[1]")
		screenshot path
		e
	end

	def get_email_has_regist_error path
		e = wait_for_location(:xpath, "//div[@id='error_explanation']/ul/li[1]")
		screenshot path
		e
	end


end



