#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 19:20:44
# @LastEditTime: 2024-09-09 17:20:29
# @LastEditors: Cloudflying
# @Description: Init Ubuntu Cli
###

_init() {
  locale-gen en_US.UTF-8
}

_install() {
  # 常见工具
  apt install -y --no-install-recommends neovim tree jq git fzf apt-utils sudo file zsh less

  # 语录
  apt install -y --no-install-recommends cowsay fortune-mod fortunes fortunes-zh

  # 系统工具
  apt install -y --no-install-recommends locales procps

  # Compress
  apt install -y --no-install-recommends p7zip p7zip-full p7zip-rar zstd gzip unar unrar-free lzma xz-utils bzip2 tar zip unzip lzip lrzip

  # Program Language
  apt install -y --no-install-recommends python2 python3 golang nodejs

  # Package Manager
  apt install -y --no-install-recommends npm python-pip

  # Code Formater
  apt install -y --no-install-recommends shfmt shellcheck

  #  System Tools
  apt install -y --no-install-recommends htop jq aria2 axel cron lsb-release ntp ntpdate diffutils psmisc

  # Database Client
  # not in debian
  # mysql-client replace with mariadb-client
  apt install -y --no-install-recommends mariadb-client

  # network
  apt install -y --no-install-recommends curl wget \
    net-tools iproute2 mtr traceroute dnsutils iputils-ping lsof corkscrew netcat-openbsd

  # File
  # duf Disk Usage/Free Utility
  apt install -y duf

  # File Share
  apt install -y cifs-utils samba rsync syncthing

  # Tools
  apt install -y --no-install-recommends eza bat

  # Security
  apt install -y --no-install-recommends ufw

  # Dev Environment Build Tookit
  # build-essential 编译工具一把梭
  apt install -y --no-install-recommends build-essential pkg-config m4 gettext re2c gnupg libc-devtools debian-keyring cmake
}
