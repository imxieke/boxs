-- 自定义文件类型
-- vim.cmd('autocmd BufNewFile,BufRead *.cu,*.cuh setf cpp')
-- vim.cmd('autocmd BufNewFile,BufRead Dockerfile.* setf dockerfile')

-- vim.cmd('autocmd BufNewFile,BufRead *.env.* setf dosini')
-- vim.cmd('autocmd BufNewFile,BufRead *.ini setf dosini')
-- vim.cmd('autocmd BufNewFile,BufRead *.ini.* setf dosini')

-- vim.cmd('autocmd BufNewFile,BufRead *.tsva setf tsv')
-- vim.cmd('autocmd BufNewFile,BufRead .htaccess,*/etc/httpd/*.conf setf apache')
-- vim.cmd('autocmd BufNewFile,BufRead */etc/apache2/sites-*/*. setf apache')
-- vim.cmd('autocmd BufNewFile,BufRead *.cxx,*.c++,*.hh,*.hxx,*.hpp,*.ipp,*.moc,*.tcc,*.inl setf cpp')
-- vim.cmd('autocmd BufNewFile,BufRead *.ps1,*.psm1,*.psd1 set filetype=powershell syntax=powershell')

-- vim.cmd("autocmd BufEnter,FileType,BufRead,BufNewFile *.abc setf bash")
-- vim.cmd("autocmd BufEnter,FileType,BufRead,BufNewFile Dockerfile.* setf dockerfile")
-- vim.cmd("autocmd BufEnter,FileType,BufRead,BufNewFile nginx.conf setf nginx")

-- vim.cmd("autocmd FileType gitcommit let b:EditorConfig_disable = 1")

vim.filetype.add({
  -- Detect and assign filetype based on the extension of the filename
  extension = {
    yml  = "yaml",
    mdx  = "mdx",
    conf = "conf",
    log  = "log",
    conf = "conf",
    env  = "dosini", 		-- autocmd 不生效
    ini  = "dosini",
  },
  -- Detect and apply filetypes based on the entire filename
  filename = {
    [".env"] = "dosini", 	-- autocmd 不生效
    ["env"] = "dosini",
    ["tsconfig.json"] = "jsonc",
    [".yamlfmt"] = "yaml",
  },
  -- Detect and apply filetypes based on certain patterns of the filenames
  pattern = {
    -- INFO: Match filenames like - ".env.example", ".env.local" and so on
    ["%.env%.[%w_.-]+"] = "dosini",
    ["tsconfig%."] = "jsonc",
    ["docker%-compose%.y.?ml"] = "yaml.docker-compose",
  },
})