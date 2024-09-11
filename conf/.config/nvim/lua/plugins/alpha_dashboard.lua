-- startify dashboard theta
local alpha = require 'alpha'
local dashboard = require 'alpha.themes.dashboard'
local dash = require 'alpha.themes.dashboard'
-- local dashboard = require 'alpha.themes.startify'
-- local theta_conf = require 'alpha.themes.theta'
-- local cdir = vim.fn.getcwd()
-- alpha.setup(require 'alpha.themes.startify'.config)
-- alpha.setup(require 'alpha.themes.theta'.config)
alpha.setup(require 'alpha.themes.dashboard'.config)

local header_text_logo = {
	" ██████╗██╗      ██████╗ ██╗   ██╗██████╗ ███████╗██╗  ██╗   ██╗██╗███╗   ██╗ ██████╗ ",
	"██╔════╝██║     ██╔═══██╗██║   ██║██╔══██╗██╔════╝██║  ╚██╗ ██╔╝██║████╗  ██║██╔════╝ ",
	"██║     ██║     ██║   ██║██║   ██║██║  ██║█████╗  ██║   ╚████╔╝ ██║██╔██╗ ██║██║  ███╗",
	"██║     ██║     ██║   ██║██║   ██║██║  ██║██╔══╝  ██║    ╚██╔╝  ██║██║╚██╗██║██║   ██║",
	"╚██████╗███████╗╚██████╔╝╚██████╔╝██████╔╝██║     ███████╗██║   ██║██║ ╚████║╚██████╔╝",
	" ╚═════╝╚══════╝ ╚═════╝  ╚═════╝ ╚═════╝ ╚═╝     ╚══════╝╚═╝   ╚═╝╚═╝  ╚═══╝ ╚═════╝ ",
}

local footer = {
	type = 'text',
	val = 'NeoCode Power by Neovim',
	opts = {
		position = 'center',
		hl = 'Type'
	}
}

local buttons = {
    type = "group",
    val = {
		-- 快捷键 显示的标题 命令
        dashboard.button("<e>", "  New file", "<cmd>ene <CR>"),
        dashboard.button("<A-p>", "  Find file By Telescope","<CMD>:Telescope find_files<CR>"),
        dashboard.button("<A-p>", "󰛔  Find file By fd","<CMD>:Telescope fd<CR>"),
        dashboard.button(":FzfLua", "󰛔  Find file By fzf","<CMD>:FzfLua files <CR>"),
        dashboard.button("SPC f h", "󰘁  Recently opened files","<CMD>:Telescope frecency<CR>"),
        dashboard.button("A f", "  Code Search","<CMD>:Telescope live_grep_args<CR>"),
        dashboard.button("SPC f m", "󱍻  Jump to bookmarks","<CMD>:Telescope bookmarks<CR>"),
        dashboard.button("SPC s l", "  Open last session","<CMD>:SessionManager load_last_session<CR>"),
        dashboard.button("A l", "󱏒  Open File Tree","<CMD>:NvimTreeToggle<CR>")
    },
    opts = {
        spacing = 1,
    },
}

-- local handle = io.popen('fortune')
-- local fortune = handle:read("*a")
-- handle:close()

-- Dashbord Config
dashboard.section.header.val = header_text_logo
dashboard.section.header.opts.position = 'center'
-- dashboard.section.header.opts = {
-- 	position = 'right',
-- 	hl = 'Type'
-- }
-- dashboard.section.footer.val = text_logo
-- dashboard.section.footer = footer
dashboard.section.footer.val = footer.val
-- dashboard.section.footer.val = fortune
dashboard.section.buttons.val = buttons.val
-- dashboard.section.buttons = buttons


-- dashboard.section.footer.type = "text"
-- dashboard.section.footer.val = os.getenv('PWD')
-- dashboard.section.footer.val = { dashboard.button("e", "  New file", "<cmd>ene <CR>") }
-- dashboard.section.header.opts.position = "center"

-- dashboard.section.footer.val = dashboard.section.header.val
-- dashboard.section.footer.val = dashboard.mru(0, vim.fn.getcwd())

-- dashboard.section.top_buttons.val = {}
-- dashboard.section.mru_cwd.val = {}
-- dashboard.section.bottom_buttons.val = {}
-- dashboard.section.bottom_buttons.val = {
-- 	{ type = "text", val = "Quick links", opts = { hl = "SpecialComment", position = "left" } },
-- 	{ type = "padding", val = 1 },
-- 	dashboard.button("e", "  New file", "<cmd>ene <CR>"),
-- 	dashboard.button("g", "  Search File", ":Telescope find_files<CR>"),
-- 	dashboard.button("l", "  Recently opened files"),
-- 	dashboard.button("r", "  Frecency/MRU", ":lua require('telescope').extensions.frecency.frecency()<CR>"),
-- 	dashboard.button("b", "  Jump to bookmarks", ":Telescope marks<CR>"),
-- 	dashboard.button("s", "  Open last session"),
-- 	dashboard.button("SPC c", "  Code Search", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>"),
-- 	dashboard.button("f", "  Code Tags Search", ":Telescope tags<CR>"),
-- 	dashboard.button("c", "  Configuration", ":!bat ~/.config/nvim/init.vim <CR>"),
-- 	dashboard.button("u", "  Update plugins", ":PackerSync<CR>"),
-- 	dashboard.button("q", "  Quit NeoVim", ":qa<CR>"),
-- }
-- vim.cmd [[autocmd User AlphaReady echo 'ready']]
