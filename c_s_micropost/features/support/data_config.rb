module Data_Config

	# 【 配 置 测 试 数 据 路 径 】

 	def config 
 		test_data 'features/fixtures/config_data.yml'
 	end

 	def login_d 
 		test_data 'features/fixtures/login_function_data.yml'
 	end

 	def regist_d
 		test_data 'features/fixtures/regist_function_data.yml'
 	end

 	def send_d
 		test_data 'features/fixtures/send_function_data.yml' 
 	end

 	def user_d
 		test_data 'features/fixtures/user_authority_data.yml'
 	end

 	def link_d
 		test_data 'features/fixtures/link_redirect_data.yml'
 	end

end


World(Data_Config)


