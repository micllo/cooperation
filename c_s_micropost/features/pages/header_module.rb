require File.expand_path'features/dialogs/header_dialog'

class HeaderModule < BasePage

	include Header_Dialog

	#【 action 】

	def access_login_page
		signin_link.click
	end

	def logout
		name_link.click
		signout_link.click
	end

	def access_send_page
		home_link.click
	end

	def access_home_page
		home_link.click
	end

	def access_help_page
		help_link.click
	end

	def access_users_page
		users_link.click
	end

	def access_setting_page
		name_link.click
		setting_link.click
	end

	# 进入自己的profile页面
	def access_self_profile_page
		name_link.click
		profile_link.click
	end

	# 进入其他用户的profile页面(针对users列表中最后一个用户)
	def access_other_profile_page
		access_users_page
		users_page.access_other_profile_page
	end

end






