Given(/^open site$/) do
	open_browser_and_site config.mode, config.driver, config.server
	browser.maximize config.max
	# browser.resize config.x, config.y
	browser.open_url config.env_host
end


Given(/^visit users page with unlogin$/) do
	browser.open_url(config.env_host + user_d.user_url)
end


Given(/^visit profile page with unlogin$/) do
	browser.open_url(config.env_host + user_d.profile_url)
end


Given(/^visit setting page with unlogin$/) do
	browser.open_url(config.env_host + user_d.setting_url)
end

