-- lsp config

local lspconfig = require('lspconfig')

local util = require('lspconfig.util')

-- The nvim-cmp almost supports LSP's capabilities so You should advertise it to LSP servers..
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
-- capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lsp_flags = {
	-- This is the default in Nvim 0.7+
	debounce_text_changes = 150,
}

require("lsp-colors").setup({
	Error = "#db4b4b",
	Warning = "#e0af68",
	Information = "#0db9d7",
	Hint = "#10B981"
})

local null_ls = require("null-ls")

null_ls.setup({
    sources = {
        null_ls.builtins.formatting.stylua,
        null_ls.builtins.completion.spell,
        -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
    },
})

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
-- local on_attach = function(client, bufnr)
-- 	-- Enable completion triggered by <c-x><c-o>
-- 	-- vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

-- 	-- Mappings.
-- 	-- See `:help vim.lsp.*` for documentation on any of the below functions
-- 	local bufopts = { noremap = true, silent = true, buffer = bufnr }
-- 	vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, bufopts)
-- 	vim.keymap.set('n', 'gd', vim.lsp.buf.definition, bufopts)
-- 	vim.keymap.set('n', 'K', vim.lsp.buf.hover, bufopts)
-- 	vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, bufopts)
-- 	vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, bufopts)
-- 	vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, bufopts)
-- 	vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, bufopts)
-- 	vim.keymap.set('n', '<space>wl', function()
-- 		print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
-- 	end, bufopts)
-- 	vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, bufopts)
-- 	vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, bufopts)
-- 	vim.keymap.set('n', '<space>ca', vim.lsp.buf.code_action, bufopts)
-- 	vim.keymap.set('n', 'gr', vim.lsp.buf.references, bufopts)
-- 	vim.keymap.set('n', '<space>f', vim.lsp.buf.formatting, bufopts)
-- end

-- 其他语言也是同样配置 aerial
-- lspconfig.vimls.setup {
-- 	on_attach = require("aerial").on_attach,
-- }

-- lspconfig.sqls.setup {
    -- 	on_attach = function(client, bufnr)
    -- 		require('sqls').on_attach(client, bufnr)
    -- 	end
    -- }

    lspconfig.intelephense.setup({
        capabilities = capabilities,
        cmd = { "intelephense", "--stdio" },
        filetypes = { "php", "php5" },
        root_dir = util.root_pattern("composer.json"),
        on_attach = function(client, bufnr)
            -- Enable (omnifunc) completion triggered by <c-x><c-o>
            vim.api.nvim_buf_set_option(bufnr, 'omnifunc', 'v:lua.vim.lsp.omnifunc')
            -- 	on_attach = require("aerial").on_attach,
		    -- vim.api.nvim_buf_set_keymap(bufnr, "n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
		    -- Here we should add additional keymaps and configuration options.
	    end,
	flags = {
		debounce_text_changes = 150,
	}
})

lspconfig.phan.setup {
	capabilities = capabilities,
	cmd = { "phan", "-m", "json", "--no-color", "--no-progress-bar", "-x", "-u", "-S", "--language-server-on-stdin",
		"--allow-polyfill-parser" },
	filetypes = { "php" },
	root_dir = util.root_pattern("composer.json"),
	single_file_support = true
}

lspconfig.psalm.setup {
	capabilities = capabilities,
	cmd = { "psalm-language-server" },
	filetypes = { "php" },
	root_dir = util.root_pattern("psalm.xml", "psalm.xml.dist"),
	single_file_support = true
}

-- lspconfig.pyright.setup {
-- 	on_attach = on_attach,
-- 	capabilities = capabilities,
-- 	flags = lsp_flags,
-- 	cmd = { "pyright-langserver", "--stdio" },
-- 	filetypes = { "python" },
-- 	settings = {
-- 		python = {
-- 			analysis = {
-- 				autoSearchPaths = true,
-- 				diagnosticMode = "workspace",
-- 				useLibraryCodeForTypes = true
-- 			},
-- 		},
-- 	},
-- 	single_file_support = true
-- }

-- lspconfig.tsserver.setup({
-- 	capabilities = capabilities,
-- 	-- Needed for inlayHints. Merge this table with your settings or copy
-- 	-- it from the source if you want to add your own init_options.
-- 	-- init_options = require("nvim-lsp-ts-utils").init_options,
-- 	flags = lsp_flags,
-- 	-- on_attach = on_attach,
-- 	on_attach = function(client, bufnr)
-- 		-- no default maps, so you may want to define some here
-- 		local opts = { silent = true }
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", ":TSLspOrganize<CR>", opts)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", ":TSLspRenameFile<CR>", opts)
-- 		vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", ":TSLspImportAll<CR>", opts)
-- 	end,
-- })

-- Golang Server Protocol
lspconfig.gopls.setup {
	capabilities = capabilities,
	cmd = { "gopls", "serve" },
	filetypes = { "go", "gomod" },
	root_dir = util.root_pattern("go.work", "go.mod"),
	settings = {
		gopls = {
			analyses = {
				unusedparams = true,
			},
			staticcheck = true,
		},
	},
}

lspconfig.pylsp.setup {
	capabilities = capabilities,
	cmd = { "pylsp" },
	filetypes = { "python" },
	settings = {
		pylsp = {
			plugins = {
				pycodestyle = {
					ignore = { 'W391' },
					maxLineLength = 100
				}
			}
		}
	}
}

-- lspconfig.lua_ls.setup({
-- 	capabilities = capabilities,
-- 	cmd = { "lua-language-server" },
-- 	filetypes = { "lua" },
--     settings = {
--         Lua = {
--             completion = {
--                 callSnippet = "Replace"
--             }
--         }
--     }
-- })

-- lspconfig.sumneko_lua.setup(luadev)

-- RishabhRD/nvim-lsputils
local bufnr = vim.api.nvim_buf_get_number(0)
vim.lsp.handlers['textDocument/codeAction'] = function(_, _, actions)
	require('lsputil.codeAction').code_action_handler(nil, actions, nil, nil, nil)
end

vim.lsp.handlers['textDocument/references'] = function(_, _, result)
	require('lsputil.locations').references_handler(nil, result, { bufnr = bufnr }, nil)
end

vim.lsp.handlers['textDocument/definition'] = function(_, method, result)
	require('lsputil.locations').definition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
end

vim.lsp.handlers['textDocument/declaration'] = function(_, method, result)
	require('lsputil.locations').declaration_handler(nil, result, { bufnr = bufnr, method = method }, nil)
end

vim.lsp.handlers['textDocument/typeDefinition'] = function(_, method, result)
	require('lsputil.locations').typeDefinition_handler(nil, result, { bufnr = bufnr, method = method }, nil)
end

vim.lsp.handlers['textDocument/implementation'] = function(_, method, result)
	require('lsputil.locations').implementation_handler(nil, result, { bufnr = bufnr, method = method }, nil)
end

vim.lsp.handlers['textDocument/documentSymbol'] = function(_, _, result, _, bufn)
	require('lsputil.symbols').document_handler(nil, result, { bufnr = bufn }, nil)
end

vim.lsp.handlers['textDocument/symbol'] = function(_, _, result, _, bufn)
	require('lsputil.symbols').workspace_handler(nil, result, { bufnr = bufn }, nil)
end
