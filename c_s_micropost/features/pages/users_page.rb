# encoding:utf-8
require File.expand_path'features/dialogs/users_dialog'

class UsersPage < BasePage

	include Users_Dialog

	#【 action 】

	def access_first_profile_page
		first_user_link.click
	end

	# 进入其他用户的profile页面(针对users列表中最后一个用户)
	def access_other_profile_page
		fourth_paging_link.click
		last_user_link.click
		sleep 1
	end

	# 删除第四个分页中的第一个用户
	#  1.进入第四个分页
	#  2.删除第一个用户
	#  3.点击alert弹框确认按钮
	def delete_first_user_in_fourth_paging
		fourth_paging_link.click
		first_delete_link.click
		alert_to_accept
	end

	# 删除第四个分页中的最后一个用户
	def delete_last_user_in_fourth_paging
		fourth_paging_link.click
		last_delete_link.click
		alert_to_accept
	end

	# 获取第四个分页中用户的li标记集合
	def li_of_user_list
		fourth_paging_link.click
		li_list = li_tag_list
		puts '第四页用户数量: ' + li_list.count.to_s
		li_list
	end


	#【 verify 】

	def verify_delete_success_msg
		delete_success_msg.text
	end

	# 判断delete链接是否存在（1不存在，2存在）
	def verify_delete_exist_or_not
		list = a_tag_list_for_delete
		if list.size == 2
			return true
		else
			return false
		end
	end

	# 判断已经删除的用户不存在了
	#  1.获取第四分页中的第一个username
	#  2.删除第四个分页中的第一个用户
	#  3.获取第四分页中的username集合
	#  4.判断该name是否存在于username集合中
	def verify_deluser_no_exist
		delname = capture_first_username_in_fourth_paging
		puts '删除的用户：' + delname
		delete_first_user_in_fourth_paging
		list = capture_username_list_in_fourth_paging

		no_exist = true
		list.each do |username|
			puts '剩余的用户：' + username.text
			if username.text == delname
				no_exist = false
			end
		end
		puts 'no_text:' + no_exist.to_s
		no_exist
	end

end








