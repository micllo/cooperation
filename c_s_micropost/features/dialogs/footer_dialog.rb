# encoding:utf-8

module Footer_Dialog

	#【 action 】
	
	def about_link
		location(:xpath, '//footer/nav/ul/li[1]')
	end

	def contact_link
		location(:xpath, '//footer/nav/ul/li[2]')
	end

end



