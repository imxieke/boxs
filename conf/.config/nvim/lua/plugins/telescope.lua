local telescope = require("telescope")
local actions = require("telescope.actions")
local trouble = require("trouble.providers.telescope")

telescope.setup {
	defaults = {
		generic_sorter = require('mini.fuzzy').get_telescope_sorter,
		history = {
			path = vim.fn.expand('$HOME') .. '/.local/share/nvim/databases/telescope_history.sqlite3',
			limit = 5000,
		}
	},
	extensions = {
		["ui-select"] = {
			require("telescope.themes").get_dropdown {
				-- even more opts
			}

			-- pseudo code / specification for writing custom displays, like the one
			-- for "codeactions"
			-- specific_opts = {
			--   [kind] = {
			--     make_indexed = function(items) -> indexed_items, width,
			--     make_displayer = function(widths) -> displayer
			--     make_display = function(displayer) -> function(e)
			--     make_ordinal = function(e) -> string
			--   },
			--   -- for example to disable the custom builtin "codeactions" display
			--      do the following
			--   codeactions = false,
			-- }
		},
		fzf = {
			fuzzy = true, -- false will only do exact matching
			override_generic_sorter = true, -- override the generic sorter
			override_file_sorter = true, -- override the file sorter
			case_mode = "smart_case", -- or "ignore_case" or "respect_case"
			-- the default case_mode is "smart_case"
		},
		packer = {
			theme = "ivy",
			layout_config = {
				height = .5
			}
		},
		live_grep_args = {
			auto_quoting = true -- enable/disable auto-quoting
		},
		frecency = {
			db_root = vim.fn.expand('$HOME') ..  "/.local/share/nvim/databases",
			show_scores = true,
			show_unindexed = true,
			ignore_patterns = { "*.git/*"},
			disable_devicons = false,
			workspaces = {
				[".config"]   = vim.fn.expand('$HOME') .. "/.config",
				["share"]     = vim.fn.expand('$HOME') .. "/.local/share",
				["Code"]      = vim.fn.expand('$HOME') .. "/Code",
				["Downloads"] = vim.fn.expand('$HOME') .. "/Downloads"
			}
		},
		file_browser = {
			theme = "ivy",
			-- disables netrw and use telescope-file-browser in its place
			hijack_netrw = true,
			path = vim.loop.cwd(),
			cwd = vim.loop.cwd(),
			cwd_to_path = false,
			grouped = false,
			files = true,
			add_dirs = true,
			depth = 1,
			auto_depth = false,
			select_buffer = false,
			hidden = { file_browser = false, folder_browser = false },
			respect_gitignore = vim.fn.executable "fd" == 1,
			follow_symlinks = true,
			browse_files = require("telescope._extensions.file_browser.finders").browse_files,
			browse_folders = require("telescope._extensions.file_browser.finders").browse_folders,
			hide_parent_dir = false,
			collapse_dirs = false,
			prompt_path = false,
			quiet = false,
			dir_icon = "",
			dir_icon_hl = "Default",
			display_stat = { date = true, size = true, mode = true },
			use_fd = true,
			git_status = true,
		},
		emoji = {
			action = function(emoji)
				-- argument emoji is a table.
				-- {name="", value="", cagegory="", description=""}

				vim.fn.setreg("*", emoji.value)
				print([[Press p or "*p to paste this emoji]] .. emoji.value)

				-- insert emoji when picked
				-- vim.api.nvim_put({ emoji.value }, 'c', false, true)
			end,
		},
		glyph = {
			action = function(glyph)
				-- argument glyph is a table.
				-- {name="", value="", category="", description=""}

				vim.fn.setreg("*", glyph.value)
				print([[Press p or "*p to paste this glyph]] .. glyph.value)

				-- insert glyph when picked
				-- vim.api.nvim_put({ glyph.value }, 'c', false, true)
			end,
		},
		ctags_outline = {
			--ctags option
			ctags = { 'ctags' },
			--ctags filetype option
			ft_opt = {
				aspvbs = '--asp-kinds=f',
				awk = '--awk-kinds=f',
				c = '--c-kinds=fp',
				cpp = '--c++-kinds=fp --language-force=C++',
				cs = '--c#-kinds=m',
				erlang = '--erlang-kinds=f',
				fortran = '--fortran-kinds=f',
				java = '--java-kinds=m',
				javascript = '--javascript-kinds=f',
				lisp = '--lisp-kinds=f',
				lua = '--lua-kinds=f',
				matla = '--matlab-kinds=f',
				pascal = '--pascal-kinds=f',
				php = '--php-kinds=f',
				python = '--python-kinds=fm --language-force=Python',
				ruby = '--ruby-kinds=fF',
				scheme = '--scheme-kinds=f',
				sh = '--sh-kinds=f',
				sql = '--sql-kinds=f',
				tcl = '--tcl-kinds=m',
				verilog = '--verilog-kinds=f',
				vim = '--vim-kinds=f',
				go = '--go-kinds=f',
				rust = '--rust-kinds=fPM',
				ocaml = '--ocaml-kinds=mf'
			},
		},
		command_palette = {
			{ "File",
				{ "entire selection (C-a)", ':call feedkeys("GVgg")' },
				{ "save current file (C-s)", ':w' },
				{ "save all files (C-A-s)", ':wa' },
				{ "quit (C-q)", ':qa' },
				{ "file browser (C-i)", ":lua require'telescope'.extensions.file_browser.file_browser()", 1 },
				{ "search word (A-w)", ":lua require('telescope.builtin').live_grep()", 1 },
				{ "git files (A-f)", ":lua require('telescope.builtin').git_files()", 1 },
				{ "files (C-f)", ":lua require('telescope.builtin').find_files()", 1 },
			},
			{ "Help",
				{ "tips", ":help tips" },
				{ "cheatsheet", ":help index" },
				{ "tutorial", ":help tutor" },
				{ "summary", ":help summary" },
				{ "quick reference", ":help quickref" },
				{ "search help(F1)", ":lua require('telescope.builtin').help_tags()", 1 },
			},
			{ "Vim",
				{ "reload vimrc", ":source $MYVIMRC" },
				{ 'check health', ":checkhealth" },
				{ "jumps (Alt-j)", ":lua require('telescope.builtin').jumplist()" },
				{ "commands", ":lua require('telescope.builtin').commands()" },
				{ "command history", ":lua require('telescope.builtin').command_history()" },
				{ "registers (A-e)", ":lua require('telescope.builtin').registers()" },
				{ "colorshceme", ":lua require('telescope.builtin').colorscheme()", 1 },
				{ "vim options", ":lua require('telescope.builtin').vim_options()" },
				{ "keymaps", ":lua require('telescope.builtin').keymaps()" },
				{ "buffers", ":Telescope buffers" },
				{ "search history (C-h)", ":lua require('telescope.builtin').search_history()" },
				{ "paste mode", ':set paste!' },
				{ 'cursor line', ':set cursorline!' },
				{ 'cursor column', ':set cursorcolumn!' },
				{ "spell checker", ':set spell!' },
				{ "relative number", ':set relativenumber!' },
				{ "search highlighting (F12)", ':set hlsearch!' },
			}
		},
		-- coc = {
		-- 	theme = 'ivy',
		-- 	prefer_locations = true, -- always use Telescope locations to preview definitions/declarations/implementations etc
		-- },
		aerial = {
		-- Display symbols as <root>.<parent>.<symbol>
		    show_nesting = {
			    ["_"] = false, -- This key will be the default
			    json = true, -- You can set the option for specific filetypes
			    yaml = true,
		    },
		},
		lsp_handlers = {
			disable = {
				-- ['textDocument/codeAction'] = true
			},
			location = {
				telescope = {},
				no_results_message = 'No references found',
			},
			symbol = {
				telescope = {},
				no_results_message = 'No symbols found',
			},
			call_hierarchy = {
				telescope = {},
				no_results_message = 'No calls found',
			},
			code_action = {
				telescope = {},
				no_results_message = 'No code actions available',
				prefix = '',
			},
		}
	}
}

-- telescope.load_extension('ultisnips')
-- telescope.load_extension("packer")
telescope.load_extension("ui-select")
telescope.load_extension("live_grep_args")
telescope.load_extension('smart_history')
telescope.load_extension("frecency")
telescope.load_extension "file_browser"
telescope.load_extension("node_modules")
telescope.load_extension('ag')
telescope.load_extension('cheat')
telescope.load_extension('gh')
telescope.load_extension('fzf')
telescope.load_extension('heading')
telescope.load_extension('emoji')
telescope.load_extension('glyph')
telescope.load_extension('ctags_outline')
telescope.load_extension('command_palette')
-- rcarriga/nvim-notify
telescope.load_extension('notify')
telescope.load_extension("noice")
-- telescope.load_extension('coc')
-- 来自 stevearc/aerial.nvim
telescope.load_extension('aerial')
-- radyz/telescope-gitsigns
telescope.load_extension('git_signs')
-- telescope.load_extension('luasnip')
-- telescope.extensions.live_grep_args.live_grep_args()
-- telescope.load_extension('media_files')
-- require'telescope'.extensions.ultisnips.ultisnips{}
-- show all opened buf outline(use current buf filetype)
-- telescope.extensions.ctags_outline.outline()
-- telescope.extensions.ctags_outline.outline({ buf = 'all' })

-- require("telescope.health").check()

-- #TODO raindrop
-- telescope.load_extension('bookmarks')
require('browser_bookmarks').setup({
    -- Available: 'brave', 'buku', 'chrome', 'chrome_beta', 'edge', 'safari', 'firefox', 'vivaldi'
    selected_browser = 'chrome',
    -- Either provide a shell command to open the URL
    url_open_command = 'open',

    -- Or provide the plugin name which is already installed
    -- Available: 'vim_external', 'open_browser'
    url_open_plugin = nil,

    -- Show the full path to the bookmark instead of just the bookmark name
    full_path = true,

    -- Provide a custom profile name for Firefox
    firefox_profile_name = nil,

    -- Add a column which contains the tags for each bookmark for buku
    buku_include_tags = false,

    -- Provide debug messages
    debug = false,
})