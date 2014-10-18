# encoding:utf-8

module Other_Profile_Dialog

	#【 action 】

	# 获取关注按钮
	def	follow_button
		wait_for_location(:name, 'commit')
	end

	# 获取follower数量
	def followers_num
		wait_for_location(:id, 'followers')
	end



	#【 verify 】


end



