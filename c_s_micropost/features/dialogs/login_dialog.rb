# encoding:utf-8

module Login_Dialog

	#【 action 】

	def email_field
		wait_for_location(:id, 'session_email')
	end

	def password_field
		location(:id, 'session_password')
	end

	def login_button
		location(:name, 'commit')
	end


	#【 verify 】

	def login_error_msg path
		e = wait_for_location(:xpath, '//body/div/div')
		screenshot path
		e
	end

	def unlogin_error_msg path
		e = wait_for_location(:xpath, '//body/div/div')
		screenshot path
		e
	end

end



