#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:44:12
# @LastEditTime: 2024-06-06 22:10:31
# @LastEditors: Cloudflying
# @Description: Init Boxs Env
###

# High Priority
source "${BOXS_CONF}/config/os/path.sh"
source "${BOXS_CONF}/config/os/alias.sh"
source "${BOXS_CONF}/config/os/proxy.sh"
source "${BOXS_CONF}/config/os/wsl.sh"

# Set up Depends

if [[ "${CURRENT_COUNTRY}" == 'CN' ]]; then
  [ ! -d "${HOME}/.local/share/zinit" ] && git clone --depth=1 https://e.coding.net/pkgs/mirrors/zinit.git ~/.local/share/zinit
  [[ ! -d "${HOME}/.oh-my-zsh" ]] && git clone --depth=1 https://e.coding.net/pkgs/mirrors/ohmyzsh.git ~/.oh-my-zsh
else
  [[ ! -d "${HOME}/.oh-my-zsh" ]] && git clone --depth=1 https://github.com/ohmyzsh/ohmyzsh.git ~/.oh-my-zsh
  [ ! -d "${HOME}/.local/share/zinit" ] && git clone --depth=1 https://github.com/zdharma-continuum/zinit.git ~/.local/share/zinit
fi

# Wait for the system to be ready
source "${BOXS_CONF}/config/os/zinit.sh"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f "${BOXS_HOME}/conf/.p10k.zsh" ]] && echo "[+] Loading p10k" && source "${BOXS_HOME}/conf/.p10k.zsh"

echo "[+] Loading Config"
for config in "${BOXS_CONF}/config/pkg/"*.sh; do
  source "${config}"
done

# Set Default Editor
if [[ -n $(command -v nvim) ]]; then
  export EDITOR='nvim'
  export VISUAL='nvim'
elif [[ -n $(command -v vim) ]]; then
  export EDITOR='vim'
  export VISUAL='vim'
fi

export CVSEDITOR="${EDITOR}"
export SVN_EDITOR="${EDITOR}"
export GIT_EDITOR="${EDITOR}"

# Java (macOS)
if [[ -d "/usr/local/opt/java11" ]]; then
  export JAVA_HOME="/usr/local/opt/java11"
elif [[ -d "/usr/local/opt/java18" ]]; then
  export JAVA_HOME="/usr/local/opt/java18"
elif [[ -d "/usr/local/opt/java" ]]; then
  export JAVA_HOME="/usr/local/opt/java"
fi

# 加载自定义 shell
echo "[+] Loading Shell"
for shell_lib in "${BOXS_HOME}/lib/shell"/*.sh; do
  source "${shell_lib}"
done

[[ -f ${BOXS_HOME}/scripts/function.sh ]] && source ${BOXS_HOME}/scripts/function.sh
# [ -f ${BOXS_HOME}/scripts/zplug.sh ] && source ${BOXS_HOME}/scripts/zplug.sh
# [ -f ${BOXS_HOME}/scripts/macos-build-env-conf.sh ] && source ${BOXS_HOME}/scripts/macos-build-env-conf.sh

# [ -d ${BOXS_CONF}/completion/zsh ] && fpath=(${BOXS_CONF}/completion/zsh $fpath)

# Plugins
# [ -f ${BOXS_HOME}/scripts/command-not-found.sh ] && source ${BOXS_HOME}/scripts/command-not-found.sh
