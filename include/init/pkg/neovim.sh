#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2026-06-27 00:26:31
 # @LastEditTime: 2026-06-27 00:27:37
 # @LastEditors: Cloudflying
# @Description: Neovim Config
###

if [[ ! -d "${HOME}/.config/nvim" ]]; then
  echo "==> NeoCode Configuration"
  git clone --depth 1 https://gitcode.com/imxieke/NeoCode.git "${HOME}"/.config/nvim
else
  echo "==> NeoCode Configuration Has Been Configured!"
fi
