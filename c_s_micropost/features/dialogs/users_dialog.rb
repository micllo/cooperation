# encoding:utf-8

module Users_Dialog

	#【 action 】

  	# 获取第四分页中的第一个username
  	def capture_first_username_in_fourth_paging
		fourth_paging_link.click
		first_username.text
  	end

  	# 获取第四分页中的username集合
  	def capture_username_list_in_fourth_paging
		fourth_paging_link.click
		username_list
  	end

	# 获取该分页中最后一个用户的删除链接
	def last_delete_link
		# 先获取所有用户的集合（包含delete链接的集合）
		# 再从集合中选择最后一个
		list = username_list
		e = list.last
		sleep 1
		red_show e
		sleep 1
		e
	end

	# 获取该分页中最后一个用户的链接
	def last_user_link
		# 先获取所有用户的集合
		# 再从集合中选择最后一个
		list = username_list
		e = list.last
		sleep 1
		red_show e
		sleep 1
		e
	end

	# 获取该分页中第一个的用户链接
	def first_user_link
		wait_for_location(:xpath, "//ul[@class='users']/li[1]/a")
	end

	# 获取第四分页链接
	def fourth_paging_link
		wait_for_location(:xpath, "//a[@href='/users?page=4']")	
	end

	# 获取该分页中第一个用户的删除链接
	def first_delete_link
		e = wait_for_location(:xpath, "//ul[@class='users']/li/a[2]")
		sleep 1
		# screenshot('./screenshot/user_authority/删除第四页第一个用户.png')
		e
	end

	# 获取该分页中 li 标记集合
	def li_tag_list
		wait_for_location_lists(:xpath, "//ul[@class='users']", :css, "li")
	end

	# 获取该分页中第一个用户
	def first_username
		wait_for_location(:xpath, "//ul[@class='users']/li/a[1]")
	end

	# 获取该分页中用户的集合
	def username_list	
		wait_for_location_lists(:xpath, "//ul[@class='users']", :css, 'a')	
	end

	# 获取所有 a 标记的集合（每个中的第二个是删除链接）
	def a_tag_list_for_delete
		e_list = wait_for_location_lists(:xpath, "//ul[@class='users']/li[2]", :css, 'a')
		# 只是为了显示一下
		location(:xpath,"//ul[@class='users']/li[2]")
		sleep 1
		if e_list == 1
			# screenshot('./screenshot/user_authority/非管理员的无delete按钮.png')
		else
			# screenshot('./screenshot/user_authority/管理员的有delete按钮.png')
		end
		e_list
	end


	#【 verify 】

	# 获取删除成功的提示信息
	def delete_success_msg
		e = wait_for_location(:xpath, '//body/div/div')
		sleep 1
		# screenshot('./screenshot/user_authority/用户删除成功.png')
		e
	end


end



