require("codeium").setup({})

-- Tabnine
local tabnine = require('cmp_tabnine.config')

-- Customize cmp highlight group
vim.api.nvim_set_hl(0, "CmpItemKindTabNine", {fg ="#6CC644"})

tabnine:setup({
	max_lines = 10,
	max_num_results = 20,
	sort = true,
	run_on_every_keystroke = true,
	snippet_placeholder = '..',
	-- ignored_file_types = {
		-- default is not to ignore
		-- uncomment to ignore in lua:
		-- lua = truekaish
	-- },
	show_prediction_strength = false
    -- min_percent = 0
})

-- cmp
local cmp = require('cmp')
local lspkind = require('lspkind')
local types = require("cmp.types")
local str = require("cmp.utils.str")
-- local compare = require('cmp_tabnine.compare')

local has_words_before = function()
	if vim.api.nvim_buf_get_option(0, "buftype") == "prompt" then return false end
	local line, col = unpack(vim.api.nvim_win_get_cursor(0))
	return col ~= 0 and vim.api.nvim_buf_get_text(0, line - 1, 0, line - 1, col, {})[1]:match("^%s*$") == nil
end

local devicons = require('nvim-web-devicons')

cmp.register_source('devicons', {
	complete = function(self, params, callback)
		local items = {}
		for _, icon in pairs(devicons.get_icons()) do
			table.insert(items, {
				label = icon.icon .. '  ' .. icon.name,
				insertText = icon.icon,
				filterText = icon.name,
			})
		end
		callback({ items = items })
	end,
})

-- 自动补全提示的数据来源
local lsp_menu = {
	buffer 		= "[Buffer]",
	nvim_lua 	= "[Lua]",
	nvim_lsp 	= "[LSP]",
	luasnip 	= "[LUASnip]",
	cmp_tabnine = "[Tabnine]",
	path 		= "[Path]",
	emoji 		= "[Emoji]",
	neorg 		= "[Neorg]"
}

-- 自动补全提示的 icon
-- TODO: 似乎没生效 待查
local lsp_symbols = {
	Text = "   (Text) ",
	Method = "   (Method)",
	Function = "   (Function)",
	Constructor = "   (Constructor)",
	Field = " ﴲ  (Field)",
	Variable = "[] (Variable)",
	Class = " (Class)",
	Interface = " ﰮ  (Interface)",
	Module = "   (Module)",
	Property = " 襁 (Property)",
	Unit = "   (Unit)",
	Value = "   (Value)",
	Enum = " 練 (Enum)",
	Keyword = "   (Keyword)",
	Snippet = "   (Snippet)",
	Color = "   (Color)",
	File = "   (File)",
	Reference = "   (Reference)",
	Folder = "   (Folder)",
	EnumMember = "   (EnumMember)",
	Constant = " ﲀ  (Constant)",
	Struct = " ﳤ  (Struct)",
	Event = "   (Event)",
	Operator = "   (Operator)",
	TypeParameter = "   (TypeParameter)",
}

cmp.setup({
	-- snippet = {
	-- 	-- REQUIRED - you must specify a snippet engine
	-- 	expand = function(args)
	-- 		require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
	-- 		-- vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
	-- 		-- require('snippy').expand_snippet(args.body) -- For `snippy` users.
	-- 	end,
	-- },
	formatting = {
		fields = {
			cmp.ItemField.Kind,
			cmp.ItemField.Abbr,
			cmp.ItemField.Menu,
		},
		format = lspkind.cmp_format({
			mode = 'symbol', -- show only symbol annotations options: 'text', 'text_symbol', 'symbol_text', 'symbol'
			maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
			ellipsis_char = '...',
			symbol_map = {
				Codeium = ""
			},

            -- Deprecated
			-- The function below will be called before any actual modifications from lspkind
			-- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
			-- before = function(entry, vim_item)
			-- 	-- Get the full snippet (and only keep first line)
			-- 	local word = entry:get_insert_text()
			-- 	if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet then
			-- 		word = vim.lsp.util.parse_snippet(word)
			-- 	end
			-- 	word = str.oneline(word)

			-- 	-- concatenates the string
			-- 	-- local max = 50
			-- 	-- if string.len(word) >= max then
			-- 	-- 	local before = string.sub(word, 1, math.floor((max - 3) / 2))
			-- 	-- 	word = before .. "..."
			-- 	-- end

			-- 	if entry.completion_item.insertTextFormat == types.lsp.InsertTextFormat.Snippet
			-- 		and string.sub(vim_item.abbr, -1, -1) == "~"
			-- 	then
			-- 		word = word .. "~"
			-- 	end
			-- 	vim_item.abbr = word

			-- 	-- tzachar/cmp-tabnine
			-- 	-- vim_item.kind = lspkind.presets.default[vim_item.kind]
			-- 	vim_item.kind = lsp_symbols[vim_item.kind]
			-- 	local menu = lsp_menu[entry.source.name]
			-- 	print(entry.source.name)
			-- 	if entry.source.name == 'cmp_tabnine' then
			-- 		if entry.completion_item.data ~= nil and entry.completion_item.data.detail ~= nil then
			-- 			menu = entry.completion_item.data.detail .. ' ' .. menu
			-- 		end
			-- 		vim_item.kind = ''
			-- 	end
			-- 	vim_item.menu = menu
			-- 	return vim_item
			-- end
		})
	},
	window = {
		completion = cmp.config.window.bordered(),
		documentation = cmp.config.window.bordered(),
	},
	mapping = {
		-- tab 自动补全
		["<Tab>"] = vim.schedule_wrap(function(fallback)
			if cmp.visible() and has_words_before() then
				cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
			else
				fallback()
			end
		end),
		['<C-b>'] = cmp.mapping.scroll_docs(-4),
		['<C-f>'] = cmp.mapping.scroll_docs(4),
		['<C-Space>'] = cmp.mapping.complete(),
		['<C-e>'] = cmp.mapping.abort(),
		-- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
		['<CR>'] = cmp.mapping.confirm({ select = true }),
	},
	sources = {
		{ name = 'calc' },
		{ name = 'tags' },
		{ name = 'ctags' },
		{ name = 'cmdline' },
		{ name = 'cmp_tabnine' },
		{ name = 'codeium' },
		-- { name = 'treesitter' },
		-- { name = 'luasnip' },
		-- 搜索文件提供关键字
		-- 太乱了  没什么卵用的
		-- { name = 'rg' },
		{ name = 'path' },
        -- 有点乱 无用的多过有用的
		-- { name = 'devicons' },
		{ name = 'nvim_lua' },
		{ name = 'nvim_lsp' },
		{ name = 'nvim_lsp_document_symbol' },
		{ name = 'nvim_lsp_signature_help' },
		-- { name = 'ultisnips' }, -- For ultisnips users.
		-- { name = 'snippy' }, -- For snippy users.
		{
			name = 'emoji',
			option = {
				-- Speficy emoji should be insert or not.
				insert = true
			},
		},
		{
			name = 'buffer',
			option = {
				-- The number of characters that need to be typed to trigger auto-completion.
				keyword_length = 3,
				-- A vim's regular expression for creating a word list from buffer content.
				keyword_pattern = [[\%(-\?\d\+\%(\.\d\+\)\?\|\h\w*\%([\-.]\w*\)*\)]],
				indexing_interval = 100,
				indexing_batch_size = 1000,
				max_indexed_line_length = 1024 * 40,
			},
		},
	},
	sorting = {
		priority_weight = 2,
		comparators = {
			require('cmp_tabnine.compare'),
			cmp.config.compare.offset,
			cmp.config.compare.exact,
			cmp.config.compare.score,
			cmp.config.compare.scopes,
			cmp.config.compare.recently_used,
			cmp.config.compare.kind,
			cmp.config.compare.sort_text,
			cmp.config.compare.length,
			cmp.config.compare.order,
			cmp.config.compare.locality,
		}
	}
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
	sources = cmp.config.sources({
		{ name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
	}, {
		{ name = 'buffer' },
	})
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = cmp.config.sources({
		{ name = 'path' }
	}, {
		{ name = 'cmdline' }
	})
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
	mapping = cmp.mapping.preset.cmdline(),
	sources = {
		{ name = 'buffer' },
		{ name = 'nvim_lsp_document_symbol' }
	}
})

vim.cmd('set completeopt=menu,menuone,noselect')

-- require("cmp_nvim_ultisnips").setup {
-- 	filetype_source = "treesitter",
-- 	show_snippets = "all",
-- 	documentation = function(snippet)
-- 		return snippet.description
-- 	end
-- }