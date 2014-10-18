# encoding: utf-8

module Page_Config

 	#【 实 例 化 base 页 面 及 配 置 启 动 模 式 】

 	def open_browser_and_site mode, driver, server = nil
		case mode
		when 'local'
			@base_page ||= BasePage.new( Selenium::WebDriver.for driver ) 
		when 'remote'
			@base_page ||= BasePage.new( Selenium::WebDriver.for(:remote, :url => "http://#{server}:4444/wd/hub", :desired_capabilities => driver) )
		else
			puts ' 启 动 服 务 器 配 置 错 误 ........' 
		end
	end


	# 【 实 例 化 所 有 页 面 】

	def browser
		@base_page
	end

	def home_page
		@home_page ||= @base_page.home_page
	end

	def header_module
		@header_module ||= @base_page.header_module
	end

	def footer_module
		@footer_module ||= @base_page.footer_module
	end

	def login_page
		@login_page ||= @base_page.login_page
	end

	def regist_page
		@regist_page ||= @base_page.regist_page
	end

	def send_page
		@send_page ||= @base_page.send_page	
	end

	def users_page
		@users_page ||= @base_page.users_page
	end

	def profile_page
		@profile_page ||= @base_page.profile_page
	end

	def other_profile_page
		@other_profile_page ||= @base_page.other_profile_page
	end


	#【 关 闭 浏 览 器 】
	
	def close_browser
		sleep 1
		@base_page.close
	end

end


World(Page_Config)



