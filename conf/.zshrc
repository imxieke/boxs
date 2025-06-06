###
# @Author: Cloudflying
# @Date: 2021-09-19 01:49:42
 # @LastEditTime: 2025-04-25 00:08:16
 # @LastEditors: Cloudflying
# @Description: zsh config filea
###

# init PATH
# 前面优先级高 覆盖系统自带的命令
export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

# Set up the system environment in advance
source ${HOME}/.boxs/conf/config/os/env.sh

# High Priority
source "${BOXS_CONF}/config/os/path.sh"
source "${BOXS_CONF}/config/os/alias.sh"
source "${BOXS_CONF}/config/os/proxy.sh"
source "${BOXS_CONF}/config/os/zinit.sh"

# Check zsh load time for debug
# zmodload zsh/zprof

# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
# if [[ -r "${BOXS_HOME}/etc/p10k/p10k-instant-prompt.zsh" ]]; then
#   source ${BOXS_HOME}/etc/p10k/p10k-instant-prompt.zsh
# fi

export ZSH=$HOME/.oh-my-zsh
# If you come from bash you might have to change your $PATH.

zstyle ':omz:update' mode reminder

HISTFILE="$HOME/.zsh_history" # The path to the history file.
HISTSIZE=100000                # The maximum number of events to save in the internal history.
SAVEHIST=100000                # The maximum number of events to save in the history file.

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

source $ZSH/oh-my-zsh.sh

# 执行切换目录命令行自动执行下面命令
auto-color-ls()
{
  emulate -L zsh
  echo
  if [[ -n "$(command -v eza)" ]]; then
    eza --all --header --icons --git
  fi
}

chpwd_functions=(auto-color-ls $chpwd_functions)

# hacker quotes
# alway show quote
# export ZSH_HACKER_QUOTES_ENABLE_WHEN_INTERACTIVE=true
[ -n "$(command -v fortune)" ] && fortune | cowsay | lolcat
