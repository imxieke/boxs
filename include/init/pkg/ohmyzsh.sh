#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-06-27 00:24:14
 # @LastEditTime: 2026-06-27 00:24:15
 # @LastEditors: Cloudflying
 # @Description: Oh My ZSH
###

if [[ ! -d "${HOME}/.oh-my-zsh" ]]; then
  echo "==> Fetch oh my zsh"
  git clone --depth 1 https://gitcode.com/rsync/ohmyzsh.git ~/.oh-my-zsh
  echo "==> Create .zshrc config file"
  ln -sf "${HOME}"/.boxs/conf/.zshrc ~/.zshrc
fi