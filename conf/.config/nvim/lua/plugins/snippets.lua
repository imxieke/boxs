require('luasnip.loaders.from_lua').lazy_load()
require("luasnip.loaders.from_vscode").lazy_load()
-- 仅加载指定语言
-- require("luasnip.loaders.from_vscode").load({ include = { "python" } })
-- 加载自定义目录 Snippets
require("luasnip.loaders.from_vscode").lazy_load({ paths = { vim.fn.expand('$HOME') .. "/.vscode/extensions/cloudflying-snippets" } })
