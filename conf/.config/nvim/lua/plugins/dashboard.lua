-- Dashboard
local db         = require('dashboard')
local home       = os.getenv('HOME')
-- type can be nil,table or function(must be return table in function)
-- if not config will use default banner
-- https://github.com/glepnir/dashboard-nvim/wiki/Ascii-Header-Text
db.custom_header = {
	"",
	" ██████╗██╗      ██████╗ ██╗   ██╗██████╗ ███████╗██╗  ██╗   ██╗██╗███╗   ██╗ ██████╗ ",
	"██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗██╔════╝██║  ╚██╗ ██╔╝██║████╗  ██║██╔════╝ ",
	"██║     ██║     ██║   ██║██║   ██║██║  ██║█████╗  ██║   ╚████╔╝ ██║██╔██╗ ██║██║  ███╗",
	"██║     ██║     ██║   ██║██║   ██║██║  ██║██╔══╝  ██║    ╚██╔╝  ██║██║╚██╗██║██║   ██║",
	"╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝██║     ███████╗██║   ██║██║ ╚████║╚██████╔╝",
	" ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ",
	"",
}

-- icon type is nil or string
-- shortcut type is nil or string also like icon
-- action type can be string or function or nil.
-- if you don't need any one of icon shortcut action ,you can ignore it.
-- type can be nil,table or function(must be return table in function)
db.custom_footer = { '🎉 Have fun with neovim ' .. os.getenv('USER') }

-- table type and in this table you can set icon,desc,shortcut,action keywords. desc must be exist and type is string
-- example of db.custom_center for new lua coder,the value of nil mean if you

-- Highlight Group
-- DashboardHeader DashboardCenter DashboardCenterIcon DashboardShortCut DashboardFooter

-- Command

-- DashboardNewFile  -- if you like use `enew` to create file,Please use this command,it's wrap enew and restore the statsuline and tabline
-- SessionSave,SessionLoad

-- db.preview_command = 'cat | lolcat -F 0.3'
-- string or function type that mean in function you can dynamic generate height width
-- db.preview_file_path = home .. '/.config/nvim/static/neovim.cat'
db.hide_statusline = false -- boolean default is true.it will hide statusline in dashboard buffer and auto open in other buffer
db.preview_file_height = 12
db.preview_file_width = 80
-- db.session_directory    -- string type the directory to store the session file
-- db.hide_tabline         -- boolean default is true.it will hide tabline in dashboard buffer and auto open in other buffer
db.custom_center = {
	{
		icon = '  ',
		desc = 'Recently latest session                  ',
		shortcut = 'SPC s l',
		action = 'SessionLoad'
	},
	{
		icon = '  ',
		desc = 'Recently opened files                   ',
		action = 'DashboardFindHistory',
		shortcut = 'SPC f h'
	},
	{
		icon = '  ',
		desc = 'Find  File                              ',
		action = 'Telescope find_files find_command=rg,--hidden,--files',
		shortcut = 'SPC f f'
	},
	{ icon = '  ',
		desc = 'File Browser                            ',
		action = 'Telescope file_browser',
		shortcut = 'SPC f b' },
	{ icon = '  ',
		desc = 'Find  word                              ',
		action = 'Telescope live_grep',
		shortcut = 'SPC f w' },
	{ icon = '  ',
		desc = 'Open Personal dotfiles                  ',
		action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
		shortcut = 'SPC f d' },
	{ icon = '  ',
		desc = 'Open Personal dotfiles                  ',
		action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
		shortcut = 'SPC f d' },
	{ icon = '  ',
		desc = 'Open Personal dotfiles                  ',
		action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
		shortcut = 'SPC f d' },
	{ icon = '  ',
		desc = 'Open Personal dotfiles                  ',
		action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
		shortcut = 'SPC f d' },
	{ icon = '  ',
		desc = 'Open Personal dotfiles                  ',
		action = 'Telescope dotfiles path=' .. home .. '/.dotfiles',
		shortcut = 'SPC f d' },
}
