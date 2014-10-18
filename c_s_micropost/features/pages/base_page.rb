class BasePage

	def initialize driver
		@driver ||= driver
	end

	#【 打 开 相 应 网 址 】
	def open_url url
		@driver.navigate.to url
	end

	#【 浏 览 器 最 大 化 】
	def maximize max = false
		unless max == false
			@driver.manage.window.maximize
		end
	end

	#【 调 整 浏 览 器 尺 寸 】
	def resize x, y
		@driver.manage.window.resize_to(x, y)
	end
	
	def title
		@driver.title
	end

	def footer_module
		FooterModule.new @driver
	end

	def header_module
		HeaderModule.new @driver
	end

	def login_page
		LoginPage.new @driver
	end

	def regist_page
		RegistPage.new @driver
	end

	def home_page
		HomePage.new @driver
	end

	def send_page
		SendPage.new @driver
	end

	def users_page
		UsersPage.new @driver
	end

	def profile_page
		ProfilePage.new @driver
	end

	def other_profile_page
		OtherProfilePage.new @driver
	end

	def close
		@driver.quit
	end


	# 批量注册用户
	def batch_regist string, num
		for i in 1..num
			home_page.access_regist_page
			name = string + "_" + i.to_s
			email = string + "_" + i.to_s + "@126.com"
			password = 111111
			regist_page.regist(name, email, password, password)
			header_module.logout
			sleep 1
		end
	end

	# 管理员批量删除用户
	def batch_delete_user email, password, num
		header_module.access_login_page
		login_page.login(email, password)
		header_module.access_users_page
		for i in 1..num
			users_page.delete_last_user_in_fourth_paging
			sleep 1
		end
		header_module.logout
	end

end



