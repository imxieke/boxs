#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2026-06-26 23:59:05
# @LastEditTime: 2026-06-27 00:00:08
# @LastEditors: Cloudflying
# @Description: Composer Package Init
###

if [[ ! -f "${HOME}/.bin/composer" ]]; then
  mkdir -p "${HOME}"/.bin
  echo "==> Install Composer"
  # https://mirrors.aliyun.com/composer/composer.phar
  wget -cq https://mirrors.tencent.com/composer/composer.phar -O "${HOME}"/.bin/composer
  chmod +x "${HOME}"/.bin/composer
else
  _info "Composer Done."
fi
