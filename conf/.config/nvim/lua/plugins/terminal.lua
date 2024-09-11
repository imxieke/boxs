-- https://github.com/akinsho/toggleterm.nvim#custom-terminals
local term = require "toggleterm"
term.setup {
	-- size can be a number or function which is passed the current terminal
	-- size = 20 | function(term)
	-- 	if term.direction == "horizontal" then
	-- 		return 15
	-- 	elseif term.direction == "vertical" then
	-- 		return vim.o.columns * 0.4
	-- 	end
	-- end,
	open_mapping = [[<c-\>]],
	--   on_open = fun(t: Terminal), -- function to run when the terminal opens
	--   on_close = fun(t: Terminal), -- function to run when the terminal closes
	--   on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
	--   on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
	--   on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_filetypes = {},
	highlights = {
		-- highlights which map to a highlight group name and a table of it's values
		-- NOTE: this is only a subset of values, any group placed here will be set for the terminal window split
		Normal = {
			guibg = "none",
		},
		NormalFloat = {
			link = 'Normal'
		},
		FloatBorder = {
			guifg = "none",
			guibg = "none",
		},
	},
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	shading_factor = 1, -- the degree by which to darken to terminal colour, default: 1 for dark backgrounds, 3 for light
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	persist_size = true,
	persist_mode = true, -- if set to true (default) the previous terminal mode will be remembered
	-- 'vertical' | 'horizontal' | 'tab' | 'float',
	-- terminal run mode
	-- float mode show terminal
	--nvim - c "ToggleTerm direction float"
	direction = 'horizontal',
	close_on_exit = true, -- close the terminal window when the process exits
	shell = vim.o.shell, -- change the default shell
	-- This field is only relevant if direction is set to 'float'
	float_opts = {
		-- The border key is *almost* the same as 'nvim_open_win'
		-- see :h nvim_open_win for details on borders however
		-- the 'curved' border is a custom border type
		-- not natively supported but implemented in this plugin.
		-- 'single' | 'double' | 'shadow' | 'curved'
		border = 'double',
		width = 500,
		height = 300,
		winblend = 3,
	}
}
-- Example:
-- Terminal:new {
--   cmd = string -- command to execute when creating the terminal e.g. 'top'
--   direction = string -- the layout for the terminal, same as the main config options
--   dir = string -- the directory for the terminal
--   close_on_exit = bool -- close the terminal window when the process exits
--   highlights = table -- a table with highlights
--   env = table -- key:value table with environmental variables passed to jobstart()
--   clear_env = bool -- use only environmental variables from `env`, passed to jobstart()
--   on_open = fun(t: Terminal) -- function to run when the terminal opens
--   on_close = fun(t: Terminal) -- function to run when the terminal closes
--   -- callbacks for processing the output
--   on_stdout = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stdout
--   on_stderr = fun(t: Terminal, job: number, data: string[], name: string) -- callback for processing output on stderr
--   on_exit = fun(t: Terminal, job: number, exit_code: number, name: string) -- function to run when terminal process exits
-- }
