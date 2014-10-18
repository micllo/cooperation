# encoding:utf-8

module Header_Dialog

	#【 action 】
	
	def home_link
		wait_for_location(:xpath, "//ul[@class='nav pull-right']/li[1]")
		# wait_for_location(:text, 'Home')
	end

	def help_link
		wait_for_location(:xpath, "//ul[@class='nav pull-right']/li[2]")
		# wait_for_location(:text, 'Help')
	end

	def signin_link
		wait_for_location(:xpath, "//ul[@class='nav pull-right']/li[3]")
		# wait_for_location(:link_text, 'Sign in')
	end

	def users_link
		wait_for_location(:xpath, "//ul[@class='nav pull-right']/li[3]")
		# wait_for_location(:text, 'Users')
	end

	def name_link
		wait_for_location(:xpath, "//ul[@class='nav pull-right']/li[4]")
	end

	def profile_link
		wait_for_location(:xpath, "//ul[@class='dropdown-menu']/li[1]")
		# wait_for_location(:text, 'Profile')
	end

	def setting_link
		wait_for_location(:xpath, "//ul[@class='dropdown-menu']/li[2]")
		# wait_for_location(:text, 'Settings')
	end

	def signout_link
		wait_for_location(:xpath, "//ul[@class='dropdown-menu']/li[4]")
		# wait_for_location(:text, 'Sign out')
	end


end




