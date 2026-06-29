###
# @Author: Cloudflying
# @Date: 2021-09-19 01:49:42
 # @LastEditTime: 2026-06-27 01:18:47
 # @LastEditors: Cloudflying
# @Description: zsh config file
###

# Set up the system environment in advance
source "${HOME}/.boxs/include/env.sh"

export ZSH=$HOME/.oh-my-zsh
# If you come from bash you might have to change your $PATH.

if [[ -f "${HOME}/.local/share/zinit/zinit.zsh" ]]; then
  # shellcheck disable=SC1091
  source "${HOME}/.local/share/zinit/zinit.zsh"
  autoload -U compinit
  compinit
  # (( ${+_comps} )) && _comps[zinit]=_zinit
  # setopt promptsubst
  # ZSH_THEME='strug'
  zinit load zsh-users/zsh-syntax-highlighting
  # 灰色显示历史运行的命令
  zinit load zsh-users/zsh-autosuggestions
  zinit load zsh-users/zsh-history-substring-search
  # 会阻止 zsh 默认的上下选择历史命令记录
  # 🤖 Real-time type-ahead completion for Zsh. Asynchronous find-as-you-type autocompletion.
  # 会实时显示对应数据 如 `cd directory` 会显示对应目录文件 似乎会导致 ~ 变成 /
  # zinit load marlonrichert/zsh-autocomplete
  # Additional completion definitions for Zsh.
  # _cmd file 官方不存在的自动补全
  zinit load zsh-users/zsh-completions
  # 快速跳转至文件夹
  zinit load agkozak/zsh-z
  # Enhanced colors for zsh
  zinit load zpm-zsh/colors
  # Colorize command output using grc and lscolors
  # zinit load unixorn/warhol.plugin.zsh
  #📎 ZSH plugin that reminds you to use existing aliases for commands you just typed
  zinit load MichaelAquilina/zsh-you-should-use
  # zinit load mafredri/zsh-async
  # 🔖 Quickly navigate your work path!
  zinit load wfxr/formarks

  # Git
  zinit load wfxr/forgit

  zinit load zdharma-continuum/history-search-multi-word
  # zinit load trystan2k/zsh-tab-title

  zinit ice depth=1
  zinit load romkatv/powerlevel10k
  # zinit light jeffreytse/zsh-vi-mode
  if [[ -n "$(command -v fzf)" ]]; then
    #   # Replace zsh's default completion selection menu with fzf!
    #   # 似乎和其他插件有功能重复
    # zinit load chitoku-k/fzf-zsh-completions
    # fzf 提供分行参数 一行一个
    zinit load Aloxaf/fzf-tab
  fi
fi

zstyle ':omz:update' mode reminder

HISTFILE="$HOME/.zsh_history"   # The path to the history file.
HISTSIZE=1000000                # The maximum number of events to save in the internal history.
SAVEHIST=1000000                # The maximum number of events to save in the history file.

# CASE_SENSITIVE="true" # Case-sensitive completion.

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
HIST_STAMPS="yyyy-mm-dd"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
DISABLE_AUTO_UPDATE="true"

# https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="strug"

# 用户自定义配置
if [[ $(uname -s) == 'Darwin' ]]; then
  plugins=(macos)
fi

plugins+=(composer colored-man-pages docker docker-compose extract gh git history rust z)

source "${ZSH}"/oh-my-zsh.sh

[ -f "${BOXS_HOME}/conf/.p10k.zsh" ] && . "${BOXS_HOME}/conf/.p10k.zsh"

# 执行切换目录命令行自动执行下面命令
auto-color-ls()
{
  emulate -L zsh
  echo
  if [[ -n "$(command -v eza)" ]]; then
    eza --all --header --icons --git
  fi
}

chpwd_functions=(auto-color-ls "${chpwd_functions}")

# hacker quotes
# alway show quote
# export ZSH_HACKER_QUOTES_ENABLE_WHEN_INTERACTIVE=true
[ -n "$(command -v fortune)" ] && fortune | cowsay | lolcat

# Added by Comate (zulu-cli)
export PATH="/home/imxieke/.comate/zulu-cli/bin:$PATH"
