-- The vim object is the global object for all the vim configuration when in a Lua file.
-- It has multiple scopes depending on what kind of configuration you want to apply:
-- vim.o: General settings like vim.o.background = 'light'
-- vim.wo: Window scope, for instance vim.wo.colorcolumn = '80'
-- vim.bo: For buffer scope, for instance vim.bo.filetype = 'lua'
-- vim.g: For global variables vim.g.mapleader = ',' (usually variables created by plugins)
-- vim.env: Environment variable pe vim.env.FZF_DEFAULT_OPTS = '--layout=reverse'
-- vim.opt: It allows you to write any variable in any scope. So it concatenates vim.o, vim.woand vim.bo.

-- 全局以及插件配置信息

require('mini.fuzzy').setup()
-- 代码对齐
require('mini.align').setup()
-- 自动补全
require('mini.completion').setup()

require("icon-picker").setup({ disable_legacy_commands = true })

-- Show source in diagnostics
vim.diagnostic.config({
	virtual_text = {
		source = "always", -- Or "if_many"
		prefix = '■', -- Could be '●', '▎', 'x'
	},
	float = {
		source = "always", -- Or "if_many"
	},
})

-- 单行引导启动
require('colorizer').setup()

-- lewis6991/impatient.nvim
--改善 neovim 启动时间 neovim 0.9 开始被自带功能代替
-- require('impatient')
-- require 'impatient'.enable_profile()

-- echasnovski/mini.nvim Components
require('mini.fuzzy').setup()

-- vim.opt.listchars:append "eol:↴"
-- 将空格使用 . 突出显示 挺难看的待优化
-- vim.opt.listchars:append "space:⋅"

-- weilbith/nvim-code-action-menu
-- The following global variables can be set to alternate the appearance of the windows:
vim.g.code_action_menu_window_border = 'single'
-- parts of the UI
vim.g.code_action_menu_show_details = true
vim.g.code_action_menu_show_diff = true

-- SirVer/ultisnips
vim.g.UltiSnipsExpandTrigger = "<tab>"
vim.g.UltiSnipsJumpForwardTrigger = "<c-b>"
vim.g.UltiSnipsJumpBackwardTrigger = "<c-z>"
-- If you want :UltiSnipsEdit to split your window.
-- vim.g.UltiSnipsEditSplit = "vertical"

-- Markdown
-- 禁止折叠 markdown 如 ### 下面字内容
vim.g.vim_markdown_folding_disabled = 1
-- The following options control which syntax extensions will be turned on. They are off by default.
vim.g.vim_markdown_math = 1

vim.g.vim_markdown_frontmatter = 1
vim.g.vim_markdown_toml_frontmatter = 1
vim.g.vim_markdown_json_frontmatter = 1

vim.g.vim_markdown_strikethrough = 1
-- 新列表默认缩进设置为 2
vim.g.vim_markdown_new_list_item_indent = 2
vim.g.vim_markdown_toc_autofit = 1

-- litee
-- require('litee.lib').setup({
--     panel = {
--         orientation = "left",
--         panel_size  = 30
--     }
-- })
-- require 'litee.filetree'.setup {
-- 	use_web_devicons = true,
-- 	icon_set_custom = { dir = "dir:" },
-- }
-- ldelossa/litee-symboltree.nvim
-- require('litee.symboltree').setup({})
-- hook
-- vim.lsp.handlers['textDocument/documentSymbol'] = vim.lsp.with(
	-- require('litee.lsp.handlers').ws_lsp_handler(), {}
	-- )
-- ldelossa/litee-calltree.nvim
-- require('litee.calltree').setup({})
-- Not Found module
-- vim.lsp.handlers['callHierarchy/incomingCalls'] = vim.lsp.with(
-- 	require('litee.lsp.handlers').ch_lsp_handler("from"), {}
-- )
-- vim.lsp.handlers['callHierarchy/outgoingCalls'] = vim.lsp.with(
-- 	require('litee.lsp.handlers').ch_lsp_handler("to"), {}
-- )

-- require('litee.bookmarks').setup({})
-- nvim-autopairs
require('nvim-autopairs').setup({
  disable_filetype = { "TelescopePrompt" , "vim" },
})
require('nvim-autopairs').enable()

-- nvimdev/hlsearch.nvim
require('hlsearch').setup()
-- nvimdev/nerdicons.nvim
require('nerdicons').setup({})