-- Custom Command
-- Create Terminal UI
-- More Details View conf/terminal.lua
local Terminal = require('toggleterm.terminal').Terminal

-- nvim_create_user_command (name,cmd,{desc = description})
-- cmd 可以直接使用 print echo 无需添加 :

vim.api.nvim_create_user_command('LazyGit',
    "lua require('toggleterm.terminal').Terminal:new({ cmd = 'lazygit', hidden = true }):toggle()", {
        bang = true,
        desc = "LazyGit For Neovim"
    })

vim.api.nvim_create_user_command('GitUI',
    "lua require('toggleterm.terminal').Terminal:new({ cmd = 'gitui', hidden = false }):toggle()", {
        bang = true,
        desc = "GitUI For Neovim"
    })

-- 代码搜索
vim.api.nvim_create_user_command('CodeSearch', 'lua require("telescope").extensions.live_grep_args.live_grep_args()', {
    bang = true,
    desc = "Telescope Code Search"
})

-- 最近文件历史排行
vim.api.nvim_create_user_command('Frecency', "lua require('telescope').extensions.frecency.frecency()", {
    bang = true,
    desc = "GitUI For Neovim"
})

-- Telescope File Browser
vim.api.nvim_create_user_command('PrettierFormats', "CocCommand prettier.formatFile", {
    bang = true,
    desc = "Prettier Format Document"
})

-- Format
vim.api.nvim_create_user_command('FileBrowser', 'lua require("telescope").extensions.file_browser.file_browser()', {
    bang = true,
    desc = "Telescope File Browser"
})

-- vim.api.nvim_create_user_command('snippets', 'require('telescope').load_extension('luasnip')', {
--     bang = true,
--     desc = "Lua Snippets"
-- })

-- undotree
vim.api.nvim_create_user_command('UndoTree', "lua require('undotree').toggle()", {
    bang = true,
    desc = "UndoTree Toggle"
})

vim.api.nvim_create_user_command('UndoTreeOpen', 'lua require("undotree").open()', {
    bang = true,
    desc = "UndoTree Open"
})

vim.api.nvim_create_user_command('UndoTreeClose', 'lua require("undotree").close()', {
    bang = true,
    desc = "UndoTree Close"
})

vim.api.nvim_create_user_command('Todo', 'TodoTelescope keywords=TODO,HACK,NOTE,WARN,PERF,TEST,FIX,FIXME,FIXIT,BUG,ISSUE', {
    bang = true,
    desc = "TODO Comment"
})

