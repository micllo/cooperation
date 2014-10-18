# encoding:utf-8

module Home_Dialog

	#【 action 】
	
	def signup_link
		wait_for_location(:xpath, "//a[@class='btn btn-large btn-primary']")
	end

	def new_win_link
		wait_for_location(:xpath, "//div[@class='center hero-unit']/h2/a")
	end

end



