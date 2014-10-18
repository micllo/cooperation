# encoding:utf-8

module Method_Helper

	#【 AutoIt 控 件 实 例 化 】
	# def initialize_autoit
	# 	@at ||= WIN32OLE.new("AutoItX3.Control")
	# end

	#【 简 化 yaml 格 式 的 方 法 】
	def hashes2ostruct object
    	return case object
     	when Hash
        	object = object.clone
        	object.each do |key,value|
             	object[key] = hashes2ostruct(value)
         	end
         	OpenStruct.new(object)
     	when Array
        	object = object.clone
         	object.map! {|i| hashes2ostruct(i) }
     	else
         	object
     	end
 	end

 	#【 获 取 测 试 数 据 】
 	def test_data path
 		hashes2ostruct(YAML.load(File.open(File.expand_path path)))
 	end


	#【 高 亮 显 示 】
	def red_show element
		@driver.execute_script("arguments[0].style.border='3px solid red'",element)
	end

	#【 截 屏 】
	def screenshot save_path
		unless save_path == false
			sleep 1
			@driver.save_screenshot(save_path)
		end
	end
	
	#【 后 退 】
	def go_back
		@driver.navigate.back
	end

	#【 前 进 】
	def go_forward
		@driver.navigate.forward
	end

	#【 刷 新 】
	def go_refresh
		@driver.navigate.refresh
	end

	
	#【 重 构 等 待 方 法 】
	def wait timeout
		@wait ||= Selenium::WebDriver::Wait.new( { :timeout => timeout } )
	end

	#【 等 待 定 位 title 】
	def verify_title title
		begin
			wait(10).until{ @driver.title.include? title }
		rescue Selenium::WebDriver::Error::TimeOutError
			puts '【 验 证 title 超 时 】'
		end
	end

	#【 等 待 验 证 text（可截屏）】
	def verify_text text, path = false
		begin
			wait(10).until{ @boolean = @driver.find_element(:tag_name, 'body').text.include? text }				
			screenshot path
			@boolean	
		rescue Selenium::WebDriver::Error::TimeOutError
			puts '【 验 证 text 超 时 】'
		end
	end


	#【 定 位 元 素 】
	def location selector, element 
		begin
			e = @driver.find_element(selector, element)
			red_show e
			e
		rescue Selenium::WebDriver::Error::NoSuchElementError
			puts '【 定 位 的 元 素 不 存 在 】'
		end
	end
	def wait_for_location selector, element 
		begin
			wait(10).until{ @driver.find_element(selector, element).displayed? }
			e = @driver.find_element(selector, element) 
			red_show e
			e
		rescue Selenium::WebDriver::Error::TimeOutError
			puts '【 定 位 元 素 超 时 】'
		end
	end



	#【 定 位 某 元 素 下 子 元 素 的 集 合 】
	def location_lists selector, element, selector2, subelement 
		begin
			@driver.find_element(selector, element).find_elements(selector2, subelement)
		rescue Selenium::WebDriver::Error::NoSuchElementError
			puts '【 定 位 的 元 素 集 合 不 存 在 】'
		end
	end
	def wait_for_location_lists selector, element, selector2, subelement 
		begin
			wait(10).until{ @driver.find_element(selector, element).find_elements(selector2, subelement) }
		rescue Selenium::WebDriver::Error::TimeOutError
			puts '【 定 位 元 素 集 合 超 时 】'
		end
	end


	#【 切 换 到 iframe 主 体 】
	def switch_to_iframe selector 
		@driver.switch_to.frame(selector)
	end

	#【 返 回 当 前 dirver 主 体 】
	def switch_to_back
		@driver.switch_to.default_content
	end

	#【 定 位 alert 弹 框 并 确 定 】
	def alert_to_accept
		@alert = @driver.switch_to.alert
		sleep 1
		@alert.accept
		sleep 1 # 需要等待弹框消失后，才能定位页面中的元素
	end


	#【 定 位 alert 弹 框 并 取 消 】
	def alert_to_dismiss
		@alert = @driver.switch_to.alert
		sleep 1
		@alert.dismiss
		sleep 1 # 需要等待弹框消失后，才能定位页面中的元素
	end

	#【 鼠 标 悬 停 的 操 作 】
	def mouse_hover
		10.times do 
			@driver.action.move_to(mo).perform
		end
	end	

	#【 定 位 到 新 窗 口 】
	# 1.获取浏览器所有窗口的句柄
	# 2.获取浏览器当前窗口的句柄
	# 3.将当前窗口移动到新窗口上
	def switch_to_new_window
		@all_wins = @driver.window_handles
		@old_win = @driver.window_handle 
		@all_wins.each do |win|
			unless win == @old_win
				@driver.switch_to.window(win)
			end
		end
	end
	
	#【 返 回 到 原 窗 口 】
	def switch_to_old_window
		@driver.switch_to.window(@old_win)
	end


	#【 获 得 浏 览 器 当 前 窗 口 的 句 柄 】
	def get_current_win_handle driver
		@driver.window_handle
	end

	#【 定 位 到 第 二 个 窗 体 】
	# 从所有窗口句柄中找到与当前窗口句柄不一样的，然后移动过去
	def switch_to_second_win driver, win_first
		@driver.window_handles.each do |win|
			unless win == win_first
				@driver.switch_to.window(win)
				sleep 1
			end
		end
	end

	#【 定 位 到 第 三 个 窗 体 】
	# 从所有窗口句柄中找到与当前窗口句柄不一样的，然后移动过去
	def switch_to_third_win driver, win_first, win_second
		@driver.window_handles.each do |win|
			unless win == win_first
				unless win == win_second
					@driver.switch_to.window(win)
					sleep 1
				end
			end
		end
	end

	#【 返 回 第 一 个 窗 体 】
	def back_to_first_win driver, win_first
		@driver.switch_to.window win_first
	end

	#【 返 回 第 二 个 窗 体 】
	def back_to_second_win driver, win_second
		@driver.switch_to.window win_second
	end


end

