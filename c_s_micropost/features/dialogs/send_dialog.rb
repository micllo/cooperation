# encoding:utf-8

module Send_Dialog

	#【 action 】

	def micropost_field
		wait_for_location(:id, 'micropost_content')
	end

	def send_button
		e = location(:name, 'commit')
		sleep 1
		# screenshot('./screenshot/send/发布微博的内容.png')
		e
	end

	def view_my_profile_link
		wait_for_location(:xpath, "//section/span/a")
	end

	def following_link
		wait_for_location(:xpath, "//section/div/a[1]")
 	end

	def followers_link
		wait_for_location(:xpath, "//section/div/a[2]")
	end


	#【 verify 】

	def send_success_msg path
		e = wait_for_location(:xpath, '//body/div/div')
		screenshot path
		e
	end

end



