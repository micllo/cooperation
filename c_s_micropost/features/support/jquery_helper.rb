# encoding:utf-8

module JqueryHelper

	# 加载jquery库的源码
	#（即：将jquery库结合到了webdriver中，这样就可以在js脚本中使用jquery库中的方法和标记了）
	def load_jquery(driver,jquery_path)

		jq = read_jquery(jquery_path)

		jq.force_encoding('utf-8')
		
		driver.execute_script(jq)
	end

	# 读取jquery类库中的源码
	#（'jquery-1.6.4.min.js'：是jquery类库的压缩文件）
	def read_jquery(jquery_path)

		js = ''

		File.open(File.expand_path(jquery_path), 'r') do |f|
			js = f.read
		end
		
		js
	end
end








