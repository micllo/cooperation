# encoding:utf-8
require File.expand_path'features/dialogs/footer_dialog'

class FooterModule < BasePage

	include Footer_Dialog

	#【 action 】
	
	def access_contact_page
		contact_link.click
	end
	
	def access_about_page
		about_link.click
	end

end






