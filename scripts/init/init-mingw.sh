#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2025-01-01 11:07:36
 # @LastEditTime: 2025-01-08 16:57:03
 # @LastEditors: Cloudflying
# @Description: Mingw64 Config
###

# # MSYS2
pacman -S --noconfirm mingw-w64-x86_64-neovim
pacman -S --noconfirm rsync
pacman -S --noconfirm zsh

# Compress
pacman -S --noconfirm xz \
  lzip \
  zstd \
  mingw-w64-x86_64-zstd \
  mingw-w64-x86_64-xz \
  mingw-w64-x86_64-brotli

pacman -S --noconfirm mingw-w64-x86_64-opencv

pacman -S --noconfirm mingw-w64-x86_64-graphicsmagick \
  mingw-w64-x86_64-imagemagick

pacman -S --noconfirm mingw-w64-x86_64-libpng \
  mingw-w64-x86_64-libjpeg-turbo \
  mingw-w64-x86_64-libtiff \
  mingw-w64-x86_64-libspng \
  mingw-w64-x86_64-libheif \
  mingw-w64-x86_64-libwebp

pacman -S --noconfirm git \
  mingw-w64-x86_64-bat \
  mingw-w64-x86_64-git-lfs \
  mingw-w64-x86_64-delta \
  mingw-w64-x86_64-gitui \
  mingw-w64-x86_64-github-cli
