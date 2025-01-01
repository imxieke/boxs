#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2025-01-01 11:07:36
 # @LastEditTime: 2025-01-01 12:51:59
 # @LastEditors: Cloudflying
# @Description: Mingw64 Config
###

# # MSYS2
pacman -S --noconfirm mingw-w64-x86_64-neovim
pacman -S --noconfirm rsync
pacman -S --noconfirm zsh

pacman -S --noconfirm git \
  mingw-w64-x86_64-bat \
  mingw-w64-x86_64-git-lfs \
  mingw-w64-x86_64-delta \
  mingw-w64-x86_64-gitui \
  mingw-w64-x86_64-github-cli
