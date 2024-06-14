###
# @Author: Cloudflying
# @Date: 2021-09-19 01:49:42
# @LastEditTime: 2024-06-14 22:01:25
# @LastEditors: Cloudflying
# @Description: zsh config file
###

# Amazon Q pre block. Keep at the top of this file.
# [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.pre.zsh"

# init PATH
# 前面优先级高 覆盖系统自带的命令
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"
# export MANPATH=''

# Set up the system environment in advance
source ${HOME}/.boxs/conf/config/os/env.sh
source ${HOME}/.boxs/conf/config/os/init.sh

# Check zsh load time for debug
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${BOXS_HOME}/etc/p10k/p10k-instant-prompt.zsh" ]]; then
  source ${BOXS_HOME}/etc/p10k/p10k-instant-prompt.zsh
fi

export ZSH=$HOME/.oh-my-zsh
# If you come from bash you might have to change your $PATH.

HISTFILE="$HOME/.zsh_history" # The path to the history file.
HISTSIZE=50000                # The maximum number of events to save in the internal history.
SAVEHIST=50000                # The maximum number of events to save in the history file.

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
  plugins=(macos brew)
fi

# Archlinux-Like
if [[ -d "/etc/pacman.d" ]]; then
  plugins=(pacman)
fi

plugins+=(ag composer colored-man-pages docker docker-compose extract fd fzf gh git history ripgrep rust z)

source $ZSH/oh-my-zsh.sh

# 执行切换目录命令行自动执行下面命令
auto-color-ls() {
  emulate -L zsh
  echo
  exa --all --header --icons --git
}

chpwd_functions=(auto-color-ls $chpwd_functions)

# hacker quotes
# alway show quote
export ZSH_HACKER_QUOTES_ENABLE_WHEN_INTERACTIVE=true
[ -n "$(command -v fortune)" ] && fortune -s | cowsay

# Amazon Q post block. Keep at the bottom of this file.
# [[ -f "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh" ]] && builtin source "${HOME}/Library/Application Support/amazon-q/shell/zshrc.post.zsh"
