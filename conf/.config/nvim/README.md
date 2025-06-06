## NeoCode
> 仅用于个人备份与学习用途

## Features
- 多款主题
- 代码高亮 treesitter
- 搜索功能 Telescope && fzf-lua
  - 文件搜索
  - 代码内容搜索
- LSP/Snippets/自动补全 CMP/Coc
  - 默认仅提供 `VSCode` 格式 by `luasnip`
- TODO
  - TodoLocList Telescope
  - TodoTelescope
  - TodoTrouble
  - 支持自定义关键字
- 快捷键
  - `<A-/>` 单行注释
  - `<A-\>` 多行注释
  - `<A-t>` 创建窗口
  - `<A-w>` 关闭窗口
  - `<A-q>` 退出编辑器
  - `<A-p>` 文件搜索
  - `<A-f>` 代码搜索

## features
- 状态栏 lualine
- 文件搜索 telescope
- 侧边文件夹栏
  - nvim-tree
  - Git 待修复文件修改状态

## TODO
view [TODO.md](docs/TODO.md)

### Prettier 代码美化 支持格式
  - JavaScript
  - TypeScript
  - Flow
  - JSX
  - JSON
  - CSS
  - SCSS
  - Less
  - HTML
  - Vue
  - Angular HANDLEBARS
  - Ember
  - Glimmer
  - GraphQL
  - Markdown
  - YAML
- 搜索
  - [x] 文件搜索
    - Telescope fd
    - Telescope find_files
  - 文件模糊搜素
  - [x] 代码搜索
  - 代码 tag 函数搜索
  - TODO
  - 注释

:TSInstall query

## 目录说明
- data/telescope-sources 自定义 emoji 等特殊字符保存目录

# Require
```bash
# macOS
# universal-ctags: need overwrite system ctags command
# ripgrep: rg command
# the_silver_searcher: ag command
brew install ripgrep fd lua universal-ctags the_silver_searcher
# for Archlinux
pacman -S ripgrep fd lua the_silver_searcher

npm i -g neovim pyright
pip3 install neovim pynvim
```


## Install and Remove

### Install
```
git clone --depth 1 https://github.com/imxieke/NeoCode.git ~/.config/nvim
```

## Remove
```
rm -fr ~/.config/nvim
```


## 目录结构
- autoload 自动载入脚本（autoload scripts）
- after 等待`plugin` 加载完成之后才加载 `after` 里的内容，所以叫做 `after`
- colors 配色方案
- compiler 编译命令:compiler使用的脚本文件
- ftdetect 在vim启动时就运行 ftdetect代表的是“filetype detection（文件类型检测）
- ftplugin	针对特定类型文件的插件（需要配合:filetype plugin命令使用）
- indent	自动缩进定义文件
- keymap	命名格式为 {language}[-{layout}][_{encoding}].vim 的Keymap文件
- lang	界面显示语言文件（英文、中文等）
- macros	宏示例（hanoi、maze、urm等），小工具（justify、matchit、swapmous等
- plugin	插件
- doc    为插件放置文档的地方 例如:help的时候可以用到
- spell  拼写检查脚本
- syntax	语法高亮度文件
- tools	工具（unicode、vimspell等）

## Example
- https://github.com/LunarVim/LunarVim
- https://github.com/hardhackerlabs/oh-my-nvim
- https://github.com/AstroNvim/AstroNvim
- https://github.com/NvChad/NvChad
- https://github.com/SpaceVim/SpaceVim
- https://github.com/LazyVim/LazyVim