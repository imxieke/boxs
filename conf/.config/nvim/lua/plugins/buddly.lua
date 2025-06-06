-- Buddly Status line
-- This variable is used to activate or deactivate Bubbly tabline.
vim.g.bubbly_tabline = 1
-- This variable is used to configure which modules/bubbles are used in the statusline,
-- and their order. Its a list of strings or lists of tables (that should follow the same structure as the components),
-- like the following:
vim.g.bubbly_statusline = {
	'mode',
	'truncate',
	'path',
	'branch',
	'signify',
	'gitsigns',
	-- 'coc',
	'divisor',
	'filetype',
	'progress',
}
-- This variable is used to define the palette available to every component and their respective colors.
-- You can define more colors than the default and use them in your components or in the configuration variable without any worry.
vim.g.bubbly_palette = {
	background = "Black",
	foreground = "White",
	black = "Black",
	red = "Red",
	green = "Green",
	yellow = "Yellow",
	blue = "Blue",
	purple = "Magenta",
	cyan = "Cyan",
	white = "White",
	lightgrey = "LightGrey",
	darkgrey = "Grey",
}
-- This variable is used to define a blacklist for in which filetypes do you want to disable some component.
vim.g.bubbly_filter = {
	branch = {
		'fern',
	},
	total_buffer_number = {
		'fern',
	},
	path = {
		'fern',
	},
	filetype = {
		'fern',
	},
}
-- This variable is used to define special characters used in the bubbles.
vim.g.bubbly_characters = {
	-- Bubble delimiters
	left = '',
	right = '',
	-- Close character for the tabline
	close = 'x',
	-- Bubble separators
	bubble_separator = ' ',
}
-- This variable is used to define the symbols used in some bubbles.
-- Every string follows the format from the C library for formatting strings.
vim.g.bubbly_symbols = {
	default = 'PANIC!',

	path = {
		readonly = 'RO',
		unmodifiable = '',
		modified = '+',
	},
	signify = {
		added = '+%s', -- requires 1 '%s'
		modified = '~%s', -- requires 1 '%s'
		removed = '-%s', -- requires 1 '%s'
	},
	gitsigns = {
		added = '+%s', -- requires 1 '%s'
		modified = '~%s', -- requires 1 '%s'
		removed = '-%s', -- requires 1 '%s'
	},
	-- coc = {
	-- 	error = 'E%s', -- requires 1 '%s'
	-- 	warning = 'W%s', -- requires 1 '%s'
	-- },
	builtinlsp = {
		diagnostic_count = {
			error = 'E%s', -- requires 1 '%s'
			warning = 'W%s', --requires 1 '%s'
		},
	},
	branch = ' %s', -- requires 1 '%s'
	total_buffer_number = '﬘ %s', --requires 1 '%d'
	lsp_status = {
		diagnostics = {
			error = 'E%d',
			warning = 'W%d',
			hint = 'H%d',
			info = 'I%d',
		},
	},
}

-- This variable defines the test used in some bubbles, if it's empty the bubble disappears.
vim.g.bubbly_tags = {
	default = 'HELP ME PLEASE!',

	mode = {
		normal = 'NORMAL',
		insert = 'INSERT',
		visual = 'VISUAL',
		visualblock = 'VISUAL-B',
		command = 'COMMAND',
		terminal = 'TERMINAL',
		replace = 'REPLACE',
		default = 'UNKOWN',
	},
	paste = 'PASTE',
	filetype = {
		noft = '<none>',
		conf = ' config',
		config = ' config',
		css = ' css',
		diff = '繁 diff',
		dockerfile = ' docker',
		email = ' mail',
		gitconfig = ' git config',
		html = ' html',
		javascript = ' javascript',
		javascriptreact = ' javascript',
		json = ' json',
		less = ' less',
		lua = ' lua',
		mail = ' mail',
		make = ' make',
		markdown = ' markdown',
		php = ' php',
		plain = ' text',
		plaintext = ' text',
		python = ' python',
		sass = ' sass',
		scss = ' scss',
		text = ' text',
		typescript = ' typescript',
		typescriptreact = ' typescript',
		vim = ' vim',
		xml = '謹 xml',
	},
}

-- This variable defines the color used by bubbles when the statusline is inactive.
-- It follows the same structure for colors as g:bubbly_colors (e.g. it can be 'red' or { foreground = 'red', background = 'blue' }).
vim.g.bubbly_inactive_color = { background = 'lightgrey', foreground = 'foreground' }
-- This variable defines which colors is used by which bubble.
-- Every color can be a string with the name of the color or a table with foreground and background keys,
-- which define which color is used for foreground and background.
vim.g.bubbly_colors = {
	default = 'red',

	mode = {
		normal = 'green', -- uses by default 'background' as the foreground color.
		insert = 'blue',
		visual = 'red',
		visualblock = 'red',
		command = 'red',
		terminal = 'blue',
		replace = 'yellow',
		default = 'white'
	},
	path = {
		readonly = { background = 'lightgrey', foreground = 'foreground' },
		unmodifiable = { background = 'darkgrey', foreground = 'foreground' },
		path = 'white',
		modified = { background = 'lightgrey', foreground = 'foreground' },
	},
	branch = 'purple',
	signify = {
		added = 'green',
		modified = 'blue',
		removed = 'red',
	},
	gitsigns = {
		added = 'green',
		modified = 'blue',
		removed = 'red',
	},
	paste = 'red',
	-- coc = {
	-- 	error = 'red',
	-- 	warning = 'yellow',
	-- 	status = { background = 'lightgrey', foreground = 'foreground' },
	-- },
	builtinlsp = {
		diagnostic_count = {
			error = 'red',
			warning = 'yellow',
		},
		current_function = 'purple',
	},
	filetype = 'blue',
	progress = {
		rowandcol = { background = 'lightgrey', foreground = 'foreground' },
		percentage = { background = 'darkgrey', foreground = 'foreground' },
	},
	tabline = {
		active = 'blue',
		inactive = 'white',
		close = 'darkgrey',
	},
	total_buffer_number = 'cyan',
	lsp_status = {
		messages = 'white',
		diagnostics = {
			error = 'red',
			warning = 'yellow',
			hint = 'white',
			info = 'blue',
		},
	},
}

vim.g.bubbly_styles = {
	default = 'bold',

	mode = 'bold',
	path = {
		readonly = 'bold',
		unmodifiable = '',
		path = '',
		modified = '',
	},
	branch = 'bold',
	signify = {
		added = 'bold',
		modified = 'bold',
		removed = 'bold',
	},
	gitsigns = {
		added = 'bold',
		modified = 'bold',
		removed = 'bold',
	},
	paste = 'bold',
	-- coc = {
	-- 	error = 'bold',
	-- 	warning = 'bold',
	-- 	status = ''
	-- },
	builtinlsp = {
		diagnostic_count = {
			error = '',
			warning = ''
		},
		current_function = ''
	},
	filetype = '',
	progress = {
		rowandcol = '',
		percentage = '',
	},
	tabline = {
		active = 'bold',
		inactive = '',
	},
	total_buffer_number = '',
	lsp_status = {
		messages = '',
		diagnostics = {
			error = '',
			warning = '',
			hint = '',
			info = '',
		},
	},
}

-- Can be '' or 'bold' or 'italic'.
vim.g.bubbly_inactive_style = ''

vim.g.bubbly_width = {
	default = 0,

	progress = {
		rowandcol = 8,
	},
}

vim.g.bubbly_timing = {
	default = 0,

	lsp_status = {
		messages = {
			update_delay = 500, -- ms
		},
	},
}
