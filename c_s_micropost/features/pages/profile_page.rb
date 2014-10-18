# encoding:utf-8
require File.expand_path'features/dialogs/profile_dialog'

class ProfilePage < BasePage

	include Profile_Dialog

	#【 action 】

	def visit_following_page
		following_link.click
	end

	def visit_followers_page
		followers_link.click
	end

	def get_following_num
		following_num.text
	end
	
	# 获取点击关注按钮前后的userA的following数量记录
	# 1.在 userA 的 profile_page 页面中，获取 following 数量
	# 2.进入 useB 的 other_profile_page 页面
	# 3.在 userB 的 other_profile_page 页面中，点击关注按钮
	# 4.进入 useA 的 profile_page 页面
	# 5.在 userA 的 profile_page 页面中，获取 following 数量
	def acquire_following_num
		@num1 = self.get_following_num
		puts 'following_num1：' + @num1.to_s
		sleep 3
		header_module.access_other_profile_page
		sleep 1
		other_profile_page.follow_user
		sleep 2
		header_module.access_self_profile_page
		@num2 = self.get_following_num
		puts 'following_num2：' + @num2.to_s
		sleep 3
	end


	#【 verify 】

	def verify_login_success
		login_success_msg.text
	end

	def verify_regist_success path = false
		regist_success_msg(path).text
	end

	def verify_following_num_increase
		# result = Integer(@num2) - Integer(@num1)
		result = @num2.to_i - @num1.to_i
		if result == 1 
			return true
		else
			return false
		end
	end

	def verify_following_num_reduce
		# result = Integer(@num2) - Integer(@num1)
		result = @num2.to_i - @num1.to_i
		if result == -1
			return true
		else
			return false
		end
	end

	def verify_name path
		get_name(path).text
	end

	def match_name name, path = false
		# if profile_page.verify_name =~ /(.*)#{name}(.*)/
		match_result = /(.*)#{name}(.*)/.match( profile_page.verify_name path )
		if match_result
			# puts "显示全部匹配的字符串：#{match_result}"
			# puts "显示第1和第2分组中匹配的字符串: #{match_result[1,2]}" 
			return true
		else
			return false
		end
	end

end






