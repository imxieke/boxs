#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 21:44:12
 # @LastEditTime: 2026-03-04 20:53:31
 # @LastEditors: Cloudflying
# @Description: Boxs Env Config
###

export PATH="/usr/local/bin:/usr/local/sbin:/usr/bin:/usr/sbin:/bin:/sbin"

export BOXS_APP_PATH="${BOXS_HOME}/usr/local/boxs"
export BOXS_CONF_PATH="${BOXS_APP_PATH}/config"
export BOXS_ALIAS_PATH="${BOXS_APP_PATH}/alias.d"
export BOXS_SECRET_HOME="${HOME}/.config/secret"
export BOXS_LOGS="${BOXS_HOME}/logs"

# Config System Environment

# 加载本地自定义变量
if [[ -f "${HOME}/.env" ]]; then
  source "${HOME}/.env"
else
  cp -fr ${BOXS_HOME}/.env-example ${HOME}/.env
  source ${HOME}/.env
fi

# 设定所属国家 否则默认为中国
# shellcheck disable=SC2143
if [[ -z "$(grep "CURRENT_COUNTRY" "${HOME}/.env")" ]]; then
  export CURRENT_COUNTRY='CN'
fi

export NALI_HOME=${HOME}/.config/nali

# 初始化 Oh my zsh
if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
  echo "==> Fetch oh my zsh"
  git clone --depth 1 https://gitcode.com/rsync/ohmyzsh.git ~/.oh-my-zsh
  echo "==> Create .zshrc config file"
  ln -sf "${HOME}"/.boxs/conf/.zshrc ~/.zshrc
fi

# zsh Plugin Manager
if [[ ! -d ~/.local/share/zinit ]]; then
  echo "==> Zinit Configuration"
  git clone --depth 1 https://gitcode.com/rsync/zinit.git ${HOME}/.local/share/zinit
fi

if [[ ! -d "${HOME}/.config/nvim" ]]; then
  echo "==> NeoCode Configuration"
  git clone --depth 1 https://gitcode.com/imxieke/NeoCode.git ${HOME}/.config/nvim
fi

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ -f "${BOXS_HOME}/conf/.p10k.zsh" ]] && echo "[+] Loading p10k" && source "${BOXS_HOME}/conf/.p10k.zsh"

echo "[+] Loading Config"
for config in "${BOXS_CONF_PATH}/pkg/"*.sh; do
  source "${config}"
done

# if [[ -n ${PHP_VERSION} ]]; then
#   if [[ -f "${HOME}/.bin/php${PHP_VERSION}" ]]; then
#     echo "[+] Set PHP Version To ${PHP_VERSION}"
#     ln -sf ${HOME}/.bin/php${PHP_VERSION} ${HOME}/.bin/php
#   fi
# fi
