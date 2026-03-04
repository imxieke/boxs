#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-03-04 20:49:15
 # @LastEditTime: 2026-03-04 20:49:16
 # @LastEditors: Cloudflying
 # @Description: Gnupg Config
###

if [[ -n "$(command -v gpg)" ]]; then
  export GPG_TTY=$(tty)
fi