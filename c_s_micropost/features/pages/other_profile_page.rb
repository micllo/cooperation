# encoding:utf-8
require File.expand_path'features/dialogs/other_profile_dialog'

class OtherProfilePage < BasePage

	include Other_Profile_Dialog

	#【 action 】

	# 关注用户
	def follow_user
		follow_button.click
	end

	# 取消关注
	def unfollow_user
		follow_button.click
	end

	def get_followers_num
		followers_num.text
	end

	# 获取点击关注按钮前后的userB的followers数量记录
	# 1.进入 userB 的 other_profile_page 页面
	# 2.在 userB 的 other_profile_page 页面中，获取 followers 数量
	# 3.在 userB 的 other_profile_page 页面中，点击关注按钮
	# 4.在 userB 的 other_profile_page 页面中，获取 followers 数量
	def acquire_followers_num
		header_module.access_other_profile_page
		@num1 = self.get_followers_num
		puts 'followers_num1：' + @num1.to_s
		sleep 3
		self.follow_user
		sleep 2
		@num2 = self.get_followers_num
		puts 'followers_num2：' + @num2.to_s
		sleep 3
	end


	#【 verify 】

	def verify_followers_num_increase
		# result = Integer(@num2) - Integer(@num1)
		result = @num2.to_i - @num1.to_i
		if result == 1 
			return true
		else
			return false
		end
	end

	def verify_followers_num_reduce
		# result = Integer(@num2) - Integer(@num1)
		result = @num2.to_i - @num1.to_i		
		if result == -1
			return true
		else
			return false
		end
	end

end




