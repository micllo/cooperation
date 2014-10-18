# encoding: utf-8

#【 注 意 After 的 执 行 顺 序 】
#（从最下面的After开始向上执行）

# 所有的scenario结束时都会执行
After do 
	close_browser
end

# 使用打标签的钩子
#（只有@logout标签的scenario才会在结束时执行）
After("@logout") do |scenario|
	puts "【 scenario failed 】" if scenario.failed?
	sleep 1 
	header_module.logout
end









