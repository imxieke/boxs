-- #TODO 增加 PHP Dockerfile
require("conform").setup({
  -- Set the log level. Use `:ConformInfo` to see the location of the log file.
  log_level = vim.log.levels.ERROR,
  -- Conform will notify you when a formatter errors
  notify_on_error = true,
  format_on_save = {
    -- These options will be passed to conform.format()
    timeout_ms = 500,
    lsp_fallback = true,
  },
  formatters_by_ft = {
    -- Conform will run multiple formatters sequentially
    go = { "goimports", "gofmt" },
    lua = { "stylua" },
    -- Conform will run multiple formatters sequentially
    python = { "isort", "black" },
    -- Use a sub-list to run only the first available formatter
    javascript = { { "prettierd", "prettier" } },
  },
  formatters = {
    shfmt = {
      -- false 则禁止与默认配置合并,将覆盖系统配置
      inherit = true,
      -- Change where to find the command
      command = "shfmt",
      args = { "-i", "2","--case-indent" "-filename", "$FILENAME" }
    },
  },
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function(args)
    require("conform").format({ bufnr = args.buf })
  end,
})

-- LSP Client Formatexpr
vim.o.formatexpr = "v:lua.require'conform'.formatexpr()"