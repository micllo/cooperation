#【 场 景 失 败 时 截 屏 并 将 图 片 嵌 入 到 html 报 告 中 】
# 调用'Cucumber'自带的'embed'方法
# embed(file_name, mime_type, label)
#  1.file_name: "嵌入图片的路径（相对与存放html报告的路径）"
#  2.mime_type: "在image文件夹下存放的文件类型"
#  3.label: "报告中的标签（点击后显示图片）"

#【 使 用 一 般 的 html 报 告 】
# After('@screenshot') do |scenario|
# 	if scenario.failed?
# 		browser.screenshot "screenshots/failed/#{scenario.__id__}.png" 
# 		embed("../screenshots/failed/#{scenario.__id__}.png", "image/png" ,"SCREENSHOT")
# 	end
# end


#【 使 用 pretty_face 模 板 的 测 试 报 告 】
After('@screenshot') do |scenario|
	if scenario.failed?
		browser.screenshot "reports/images/#{scenario.__id__}.png" 
		embed("../images/#{scenario.__id__}.png", "image/png" ,"SCREENSHOT")
	end
end


