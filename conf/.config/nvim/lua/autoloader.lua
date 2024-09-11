-- 加载 Vim 自定义参数
require "conf/setting"
require "conf/filetype"
require "conf/autocmd"

-- 加载插件
require "conf/plugins"

-- 自定义函数
require "conf/helper"

-- 加载 keymap 快捷键绑定
require 'conf/keymaps'

require 'conf/config'
-- 自定义命令行
require "conf/command"

-- 插件快捷配置

-- UI
-- Statusline
require 'plugins/lualine'
require 'plugins/nvimtree'
-- 启动界面
require 'plugins/alpha_dashboard'
-- require 'plugins/dashboard'
require 'plugins/web_icons'
require 'plugins/dressing'

require 'plugins/cmp'
require 'plugins/telescope'
require 'plugins/trouble'
require 'plugins/cheatsheet'
-- require 'plugins/syntax_tree_surfer'
require 'plugins/undotree'
require 'plugins/aerial'
require 'plugins/indent_blankline'

-- 插件配置信息
-- LSP
-- require 'plugins/treesitter'
require 'plugins/lsp'
require 'plugins/lspkind'
require 'plugins/lspsaga'

-- require 'plugins/coc'

-- # TODO 报错
-- require 'plugins/snippets'
require 'plugins/comment'

require 'plugins/terminal'
require 'plugins/session'
require 'plugins/notify'
require 'plugins/noice'
require 'plugins/todo'
require 'plugins/bufferline'

require 'plugins/symbols_outline'
require 'plugins/buddly'
require 'plugins/neogit'
require 'plugins/vgit'

require 'plugins/gitsigns'

-- Search
require 'plugins/search'