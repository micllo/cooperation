# encoding:utf-8

module Profile_Dialog

	#【 action 】

	def following_link
		wait_for_location(:xpath, "//section/div/a[1]")
	end

	def followers_link
		wait_for_location(:xpath, "//section/div/a[2]")
	end

	# 获取following数量
	def following_num
		wait_for_location(:id, 'following')	
	end



	#【 verify 】

	def get_name path
		e =	wait_for_location(:tag_name, 'h1')
		screenshot path
		e
	end


	def regist_success_msg path
		e = wait_for_location(:xpath, '//body/div/div')
		screenshot path
		e
	end
end



