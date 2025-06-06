## 不需要则不添加
```lua
	-- Check syntax in Vim asynchronously and fix files, with Language Server Protocol (LSP) support
	use "dense-analysis/ale"
	-- Simple winbar/statusline plugin that shows your current code context
	-- use "SmiteshP/nvim-navic"

	-- CSS3 syntax (and syntax defined in some foreign specifications) support for Vim's built-in syntax/css.vim
	-- use 'hail2u/vim-css3-syntax'
	-- Syntax highlighting for Dart in Vim
	-- use 'dart-lang/dart-vim-plugin'
	-- Vim syntax highlighting rules for modern CMake.
	-- use 'pboettch/vim-cmake-syntax'
	-- c or cpp syntax files
	-- use 'vim-jp/vim-cpp'
	-- Vim filetype and tools support for Crystal language.
	-- use 'vim-crystal/vim-crystal'
	-- Kotlin plugin for Vim. Featuring: syntax highlighting, basic indentation, Syntastic support
	-- use 'udalov/kotlin-vim'
	-- Enhanced javascript syntax file for Vim
	-- use 'jelera/vim-javascript-syntax'
	-- Vim syntax file & snippets for Docker's Dockerfile and docker-compose
	-- use 'ekalinin/Dockerfile.vim'
	-- Vim support for editing fish scripts
	-- use 'blankname/vim-fish'
	-- vim syntax for helm templates (yaml + gotmpl + sprig + custom)
	-- use 'towolf/vim-helm'
	-- Improved PHP omni-completion. Based on the default phpcomplete.vim.
	-- use 'shawncplus/phpcomplete.vim'
	-- PHP Syntax highlighting
	-- use 'StanAngeloff/php.vim'
	-- Vim support for Composer PHP projects
	-- use 'noahfrederick/vim-composer'
	-- Vim support for Laravel/Lumen projects
	-- use 'noahfrederick/vim-laravel'
	-- JSON manipulation and pretty printing
	-- use 'tpope/vim-jdaddy'
	-- Edit Bash scripts in Vim/gVim. Insert code snippets, run, check, and debug the code and look up help.
	-- use 'WolfgangMehner/bash-support'
	-- Edit AWK scripts in Vim/gVim. Insert code snippets, run, and check the code and look up help.
	-- use 'WolfgangMehner/awk-support'
	-- Edit Lua scripts in Vim/gVim/Neovim. Insert code snippets, run, compile, and check the code and look up help
	-- use 'WolfgangMehner/lua-support'
	-- Edit LaTeX documents in Vim/gVim/Neovim. Insert commands, run the typesetter and BibTeX and look up help.
	-- use 'WolfgangMehner/latex-support'
	-- Edit Perl scripts in Vim/gVim. Insert code snippets, run, check, and profile the code and look up help.
	-- use 'WolfgangMehner/perl-support'
	-- Edit C/C++ programs in Vim/gVim. Insert code snippets, compile the code, run Make/CMake/... and look up help.
	-- use 'WolfgangMehner/c-support'
	-- Edit VimL scripts in Vim/gVim/Neovim. Insert code snippets, quickly comment the code and look up help.
	-- use 'WolfgangMehner/vim-support'
	-- Edit Matlab scripts in Vim/gVim. Insert code snippets, run the code checker and look up help.
	-- use 'WolfgangMehner/matlab-support'
	-- Vim syntax highlighting for Blade templates
	-- use 'jwalton512/vim-blade'
	-- Vim utility scripts for AppleScript
	-- use 'mityu/vim-applescript'
	-- Brewfile syntax for Vim
	-- use 'bfontaine/Brewfile.vim'
	-- Yet Another TypeScript Syntax: The most advanced TypeScript Syntax Highlighting in Vim
	-- use 'HerringtonDarkholme/yats.vim'
	-- Inspect the state of a repository and execute Git commands without leaving Vim.
	-- Manage Git repos from within Vim
	-- use 'WolfgangMehner/git-support'
	-- use 'rust-lang/rust.vim'
	-- A Filetype plugin for csv files
	-- use 'chrisbra/csv.vim'
	-- A modern Vim and neovim filetype plugin for LaTeX files
	-- use 'lervag/vimtex'
	-- jsonc syntax support for vim
	-- use 'neoclide/jsonc.vim'
```

"  aerial.nvim ============================================================================
"  hi link AerialClass Type
"  hi link AerialClassIcon Special
"  hi link AerialFunction Special
"  hi AerialFunctionIcon guifg=#cb4b16 guibg=NONE guisp=NONE gui=NONE cterm=NONE

" There's also this group for the cursor position
"  hi link AerialLine QuickFixLine
" If highlight_mode="split_width", you can set a separate color for the
" non-current location highlight
"  hi AerialLineNC guibg=Gray

" You can customize the guides (if show_guide=true)
"  hi link AerialGuide Comment
" You can set a different guide color for each level
"  hi AerialGuide1 guifg=Red
"  hi AerialGuide2 guifg=Blue

```lua
-- ziontee113/syntax-tree-surfer
-- Example mappings 
-- Syntax Tree Surfer V2 Mappings
-- Targeted Jump with virtual_text
local sts = require("syntax-tree-surfer")
vim.keymap.set("n", "gv", function() -- only jump to variable_declarations
	sts.targeted_jump({ "variable_declaration" })
end, opts)
vim.keymap.set("n", "gfu", function() -- only jump to functions
	sts.targeted_jump({ "function", "arrrow_function", "function_definition" })
  --> In this example, the Lua language schema uses "function",
  --  when the Python language uses "function_definition"
  --  we include both, so this keymap will work on both languages
end, opts)
vim.keymap.set("n", "gif", function() -- only jump to if_statements
	sts.targeted_jump({ "if_statement" })
end, opts)
vim.keymap.set("n", "gfo", function() -- only jump to for_statements
	sts.targeted_jump({ "for_statement" })
end, opts)
vim.keymap.set("n", "gj", function() -- jump to all that you specify
	sts.targeted_jump({
		"function",
	  "if_statement",
		"else_clause",
		"else_statement",
		"elseif_statement",
		"for_statement",
		"while_statement",
		"switch_statement",
	})
end, opts)

-------------------------------
-- filtered_jump --
-- "default" means that you jump to the default_desired_types or your lastest jump types
vim.keymap.set("n", "<A-n>", function()
	sts.filtered_jump("default", true) --> true means jump forward
end, opts)
vim.keymap.set("n", "<A-p>", function()
	sts.filtered_jump("default", false) --> false means jump backwards
end, opts)

-- non-default jump --> custom desired_types
vim.keymap.set("n", "your_keymap", function()
	sts.filtered_jump({
		"if_statement",
		"else_clause",
		"else_statement",
	}, true) --> true means jump forward
end, opts)
vim.keymap.set("n", "your_keymap", function()
	sts.filtered_jump({
		"if_statement",
		"else_clause",
		"else_statement",
	}, false) --> false means jump backwards
end, opts)

-------------------------------
-- jump with limited targets --
-- jump to sibling nodes only
vim.keymap.set("n", "-", function()
	sts.filtered_jump({
		"if_statement",
		"else_clause",
		"else_statement",
	}, false, { destination = "siblings" })
end, opts)
vim.keymap.set("n", "=", function()
	sts.filtered_jump({ "if_statement", "else_clause", "else_statement" }, true, { destination = "siblings" })
end, opts)

-- jump to parent or child nodes only
vim.keymap.set("n", "_", function()
	sts.filtered_jump({
		"if_statement",
		"else_clause",
		"else_statement",
	}, false, { destination = "parent" })
end, opts)
vim.keymap.set("n", "+", function()
	sts.filtered_jump({
		"if_statement",
		"else_clause",
		"else_statement",
	}, true, { destination = "children" })
end, opts)
```

```viml
highlight link LspSagaFinderSelection Search
" or
highlight link LspSagaFinderSelection guifg='#ff0000' guibg='#00ff00' gui='bold'
```

开启光亮光标行
  set cursorline
  hi CursorLine   cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white
"开启高亮光标列
  set cursorcolumn
  hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

使用选项gui=attribute，来定义图形窗口下语法元素的显示属性。
颜色选项 black, brown, grey, blue, green, cyan, magenta, yellow, white
vim.cmd('set background=dark')
vim.cmd('colorscheme snow')
vim.cmd('hi Normal guibg=#0a0a0a')

vim.lsp.set_log_level("debug")
```lua
-- nvim-lspconfig
-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap=true, silent=true }
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float, opts)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, opts)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, opts)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist, opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
local on_attach = function(client, bufnr)
  -- Enable completion triggered by <c-x><c-o>
  vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

  -- Mappings.
  -- See `:help vim.lsp.*` for documentation on any of the below functions
  local bufopts = { noremap=true, silent=true, buffer=bufnr }
  vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
  vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
  vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
  vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
  vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
  vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
  vim.keymap.set('n', '<space>wl', function()
    print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
  end, bufopts)
  vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
  vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
  vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
  vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
  vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
end

-- cmp maping
        ["<Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.expand_or_jump_forwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        ),
        ["<S-Tab>"] = cmp.mapping(
          function(fallback)
            cmp_ultisnips_mappings.jump_backwards(fallback)
          end,
          { "i", "s", --[[ "c" (to enable the mapping in command mode) ]] }
        )

```

cmp map
  mapping = cmp.mapping.preset.insert({
    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<CR>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    },
    ['<Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      else
        fallback()
      end
    end, { 'i', 's' }),
    ['<S-Tab>'] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { 'i', 's' }),
  })

luasnip
    ["<Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_next_item()
      elseif luasnip.expand_or_jumpable() then
        luasnip.expand_or_jump()
      elseif has_words_before() then
        cmp.complete()
      else
        fallback()
      end
    end, { "i", "s" }),

    ["<S-Tab>"] = cmp.mapping(function(fallback)
      if cmp.visible() then
        cmp.select_prev_item()
      elseif luasnip.jumpable(-1) then
        luasnip.jump(-1)
      else
        fallback()
      end
    end, { "i", "s" }),

Intellij-like mapping
    ["<Tab>"] = cmp.mapping(function(fallback)
      -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
      if cmp.visible() then
        local entry = cmp.get_selected_entry()
	if not entry then
	  cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
	else
	  cmp.confirm()
	end
      else
        fallback()
      end
    end, {"i","s","c",}),



```viml
"  Terminal colors for seoul256 color scheme
let g:terminal_color_0 = '#4e4e4e'
let g:terminal_color_1 = '#d68787'
let g:terminal_color_2 = '#5f865f'
let g:terminal_color_3 = '#d8af5f'
let g:terminal_color_4 = '#85add4'
let g:terminal_color_5 = '#d7afaf'
let g:terminal_color_6 = '#87afaf'
let g:terminal_color_7 = '#d0d0d0'
let g:terminal_color_8 = '#626262'
let g:terminal_color_9 = '#d75f87'
let g:terminal_color_10 = '#87af87'
let g:terminal_color_11 = '#ffd787'
let g:terminal_color_12 = '#add4fb'
let g:terminal_color_13 = '#ffafaf'
let g:terminal_color_14 = '#87d7d7'
let g:terminal_color_15 = '#e4e4e4'

let g:terminal_ansi_colors = [
  \ '#4e4e4e', '#d68787', '#5f865f', '#d8af5f',
  \ '#85add4', '#d7afaf', '#87afaf', '#d0d0d0',
  \ '#626262', '#d75f87', '#87af87', '#ffd787',
  \ '#add4fb', '#ffafaf', '#87d7d7', '#e4e4e4'
\ ]
```