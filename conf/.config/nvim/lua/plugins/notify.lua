-- 定义 notify 可以快速全局使用
vim.notify = require("notify")

-- TODO: 支持制定语言 但是没发现有什么卵用

-- level: info error warning debug trace
vim.vnotify = function(text, level, title)
	if (level == nil) then
		level = "info"
	end

	if (title == nil) then
		title = "Vim Notify"
	end

	vim.notify(text, level, {
		title = title
	})
end

-- 定时执行通知
-- vim.notify("This is an error message.\nSomething went wrong!", "error", {
-- 	title = plugin,
-- 	on_open = function()
-- 		vim.notify("Attempting recovery.", vim.log.levels.WARN, {
-- 			title = plugin,
-- 		})
-- 		local timer = vim.loop.new_timer()
-- 		timer:start(2000, 0, function()
-- 			vim.notify({ "Fixing problem.", "Please wait..." }, "info", {
-- 				title = plugin,
-- 				timeout = 3000,
-- 				on_close = function()
-- 					vim.notify("Problem solved", nil, { title = plugin })
-- 					vim.notify("Error code 0x0395AF", 1, { title = plugin })
-- 				end,
-- 			})
-- 		end)
-- 	end,
-- })
