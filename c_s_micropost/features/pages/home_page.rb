# encoding:utf-8
require File.expand_path'features/dialogs/home_dialog'

class HomePage < BasePage

	include Home_Dialog

	#【 action 】

	def access_regist_page
		signup_link.click
	end

	def visit_new_win
		new_win_link.click
	end


	#【 verify 】

	def verify_new_win_title title
		switch_to_new_window
		sleep 3
		verify_title title
	end

end





