function file_exists(path)
	local file = io.open(path, "rb")
	if file then file:close() end
	return file ~= nil
end

function print_hello()
	print("Hello World")
end

-- 执行 vim 命令
function exec_vim_cmd()
	vim.cmd(":lua print_hello()")
end

function nvim_exec(cmd)
	vim.api.nvim_exec(cmd, false)
end
