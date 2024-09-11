-- 快捷键绑定
-- local keymap = vim.keymap -- for conciseness
-- local noremap = { noremap = true, silent = true }

-- mode 运行模式 Insert Normal 模式 key 绑定的按键 cmd 绑定命令 opt 可选参数 应该是函数或命令的参数
-- vim.api.nvim_set_keymap(mode, key, cmd, opt)
local default_opts = {
    noremap = true,
    silent = true,
    expr = false,
    nowait = false,
    script = false,
    unique = false
}

-- mode string | list | table 运行的运行模式 i insert n normal {i,n}
-- keys string 绑定的按键
-- cmd  string 绑定的命令 需添加 `<CMD>` 否则会直接输入
-- opts table  绑定的参数
-- 系统命令 需添加 ! 如执行 whoami :!whoami<CR> <CR> 是自动回车执行
local keymap = function(mode, keys, cmd, opts)
    local o = vim.tbl_deep_extend('force', default_opts, opts or {
        silent = true,
        noremap = true
    })
    vim.api.nvim_set_keymap(mode, keys, cmd, o)
end

local map = function(mode, keys, cmd, opts)
    if (opts == nil) then
        opts = {
            noremap = true,
            silent = true,
            expr = false,
            nowait = false,
            script = false,
            unique = false
        }
    end
	vim.keymap.set(mode, keys, cmd, opts)
end

-- 重置按键位初始状态
map({'i','n'},'<TAB>','<TAB>')

-- 文件编辑
-- 撤销编辑
keymap("n", "<A-z>", "<CMD>:undo<CR>")
keymap("i", "<A-z>", "<CMD>:undo<CR>")
-- 恢复编辑
keymap("n", "<A-S-z>", "<CMD>:redo<CR>")
keymap("i", "<A-S-z>", "<CMD>:redo<CR>")

-- keymap("n", "<C-p>")
-- 创建新文件
keymap("n", "n", "<cmd>ene <CR>")
-- 最近文件历史记录 根据频次排序
keymap("n", "h", ":lua require('telescope').extensions.frecency.frecency()<CR>")
keymap("n", "<C-c>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")
keymap("i", "<C-c>", ":lua require('telescope').extensions.live_grep_args.live_grep_args()<CR>")

-- quickui
-- 顶部菜单栏
keymap("n", "<A-m>", "<CMD>:call quickui#menu#open()<CR>")
keymap("i", "<A-m>", "<CMD>:call quickui#menu#open()<CR>")
-- quickui context
keymap("n", "<A-m><A-l>", ":call RightMenuContext()<CR>")
keymap("i", "<A-m><A-l>", ":call RightMenuContext()<CR>")

-- NvimTreeOpen, NvimTreeClose, NvimTreeFocus, NvimTreeFindFileToggle, and NvimTreeResize are also available if you need them
-- 打开或关闭 nvim tree文件树🌲
-- keymap("n", "<A-l>", "<CMD>:NvimTreeToggle<CR>")
-- keymap("i", "<A-l>", "<CMD>:NvimTreeToggle<CR>")
-- keymap({"i", "n"}, "<A-l>", "<CMD>:NvimTreeToggle<CR>")
map({"i", "n"}, "<A-l>", "<CMD>:NvimTreeToggle<CR>")
map({"i","n"}, "<A-l><A-f>", ":NvimTreeFocus<CR>")

-- Common Keymap
-- 退出当前窗口
map({'i', 'n'}, "<A-q>", ":q<CR>")
-- 退出所有窗口
map({'i', 'n'}, "<A-q><A-a>", ":qa!<CR>")
-- 前一个窗口
map({'i', 'n'}, '<A-Left>', '<CMD>:BufferLineCyclePrev<CR>')
-- 后一个窗口
map({'i', 'n'}, '<A-Right>', '<CMD>:BufferLineCycleNext<CR>')


-- -- Telescope
-- 查找文件并打开
-- 等同于下面 nnoremap <leader>ff <cmd>lua require('telescope.builtin').find_files()<cr>
keymap("n", "<A-p>", "<CMD>:Telescope find_files<CR>")
keymap("i", "<A-p>", "<CMD>:Telescope find_files<CR>")

-- 查找文件内容
keymap("n", "<A-f>", "<CMD>:Telescope live_grep<CR>")
keymap("i", "<A-f>", "<CMD>:Telescope live_grep<CR>")

-- "  trouble.nvim
-- 类似 VSCode 的Dev Toolbar
keymap("n", "<A-d>", "<CMD>:TroubleToggle<CR>")
keymap("i", "<A-d>", "<CMD>:TroubleToggle<CR>")

-- nnoremap <leader>xx <cmd>TroubleToggle<cr>
-- nnoremap <leader>xw <cmd>TroubleToggle workspace_diagnostics<cr>
-- nnoremap <leader>xd <cmd>TroubleToggle document_diagnostics<cr>
-- nnoremap <leader>xq <cmd>TroubleToggle quickfix<cr>
-- nnoremap <leader>xl <cmd>TroubleToggle loclist<cr>
-- nnoremap gR <cmd>TroubleToggle lsp_references<cr>

-- 注释
-- 行注释
-- 块注释
-- require('Comment.api').call('toggle.blockwise.current', 'g@$')
-- {"i","n"}
-- vim.keymap.set({"i", "n"}, '<A-/>', require('Comment.api').call('toggle.blockwise.current', 'g@$'), {
--     expr = true
-- })

-- TODO: 不可以直接 map 设置 insert 模式不生效 待修复
vim.keymap.set({"i", "n"}, '<A-/>', require('Comment.api').call('toggle.linewise.current', 'g@$'), {
    expr = true
})

vim.keymap.set({"i", "n"}, '<A-\\>', require('Comment.api').call('toggle.blockwise.current', 'g@$'), {
    expr = true
})

-- Copy to system clipboard
-- keymap('v', [[<C-c>]], [["+y]])

-- " Word completion with custom spec with popup layout option
-- inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})
-- nnoremap <c-k> :<c-u>MatchupWhereAmI?<cr>

-- "  https://github.com/L3MON4D3/LuaSnip
-- " press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- " -1 for jumping backwards.
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

-- " For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

-- "  LuaSnip
-- " press <Tab> to expand or jump in a snippet. These can also be mapped separately
-- " via <Plug>luasnip-expand-snippet and <Plug>luasnip-jump-next.
-- imap <silent><expr> <Tab> luasnip#expand_or_jumpable() ? '<Plug>luasnip-expand-or-jump' : '<Tab>'
-- " -1 for jumping backwards.
-- inoremap <silent> <S-Tab> <cmd>lua require'luasnip'.jump(-1)<Cr>

-- snoremap <silent> <Tab> <cmd>lua require('luasnip').jump(1)<Cr>
-- snoremap <silent> <S-Tab> <cmd>lua require('luasnip').jump(-1)<Cr>

-- " For changing choices in choiceNodes (not strictly necessary for a basic setup).
-- imap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'
-- smap <silent><expr> <C-E> luasnip#choice_active() ? '<Plug>luasnip-next-choice' : '<C-E>'

-- inoremap <C-n>   <Cmd>call pum#map#insert_relative(+1)<CR>
-- inoremap <C-p>   <Cmd>call pum#map#insert_relative(-1)<CR>
-- inoremap <C-y>   <Cmd>call pum#map#confirm()<CR>
-- inoremap <C-e>   <Cmd>call pum#map#cancel()<CR>
-- inoremap <PageDown> <Cmd>call pum#map#insert_relative_page(+1)<CR>
-- inoremap <PageUp>   <Cmd>call pum#map#insert_relative_page(-1)<CR>

-- "  Vim-lsp
-- function! s:on_lsp_buffer_enabled() abort
--     if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
--     nmap <buffer> gd <plug>(lsp-definition)
--     nmap <buffer> gs <plug>(lsp-document-symbol-search)
--     nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
--     nmap <buffer> gr <plug>(lsp-references)
--     nmap <buffer> gi <plug>(lsp-implementation)
--     nmap <buffer> gt <plug>(lsp-type-definition)
--     nmap <buffer> <leader>rn <plug>(lsp-rename)
--     nmap <buffer> [g <plug>(lsp-previous-diagnostic)
--     nmap <buffer> ]g <plug>(lsp-next-diagnostic)
--     nmap <buffer> K <plug>(lsp-hover)
--     nnoremap <buffer> <expr><c-f> lsp#scroll(+4)
--     nnoremap <buffer> <expr><c-d> lsp#scroll(-4)

--     let g:lsp_format_sync_timeout = 1000
--     autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

--     " refer to doc to add more commands
-- endfunction
-- " Shortcutting split navigation:

-- lsp-config Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, default_opts)
-- vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, default_opts)
-- vim.keymap.set('n', ']d', vim.diagnostic.goto_next, default_opts)
-- vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, default_opts)

vim.keymap.set('n', '<leader>fb', require('browser_bookmarks').select, {
  desc = 'Fuzzy search browser bookmarks',
})