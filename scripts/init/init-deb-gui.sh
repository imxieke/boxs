#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 19:21:29
# @LastEditTime: 2024-06-03 19:50:14
# @LastEditors: Cloudflying
# @Description: Init Ubuntu GUI
###

_install() {
  # Not in Ubuntu Source, View Mint Repo
  # xreader http://github.com/linuxmint/xreader
  # bulky Rename File Name
  # xviewer Pic View
  # pix image viewer and browser
  # webapp-manager Fetch Web App to Client
  # thingy

  # ubuntu-kylin-software-center 依赖
  apt install -y python3 python3-pip
  # App Store
  apt install -y ubuntu-kylin-software-center synaptic apper appstream \
    snapd snap-store \
    gnome-software gnome-software-plugin-flatpak gnome-software-plugin-snap

  snap install snap-store

  aptdaemon
  update-manager

  # Remote Desktop
  apt install -y remmina

  # Mail
  apt install -y evolution kmail

  # Documents && Reader
  # akregator rss/atom reader
  apt install -y gnome-books evince akregator okular

  # Game
  # aisleriot 卡牌
  apt install -y gnome-2048 gnome-mines gnome-mahjongg kajongg kmahjongg kshisen xmahjongg aisleriot gnome-sudoku

  # Archive
  apt install -y engrampa ark

  # MultiMedia
  apt install -y shotwell elisa

  # Chat
  # hexchat IRC
  apt install -y hexchat

  # Terminal
  apt install -y gnome-console

  # Dev
  apt install -y kate kwrite

  # Downloader
  apt install -y transmission transmission-cli

  # PhotoGraph Editor
  # drawing draw
  apt install -y drawing kolourpaint

  # System
  # mate-utils Include: Dictionary, Disk Usage Analyzer,ScreenShot,Search Tool, System Log,
  # timeshift Sync File
  # mate-power-manager
  # mate-system-monitor
  # mintbackup
  # mintreport
  # mintupdate
  # mate-session-properties
  # seahorse GNOME front end for GnuPG
  # kde-spectacle ScreenShot
  apt install -y gnome-system-monitor gnome-calculator gnome-calendar mate-utils timeshift \
    seahorse \
    gnome-logs \
    kcalc kcharselect kfind kgpg kmag ktnef kde-spectacle kwalletmanager partitionmanager

  ubuntu-kylin-software-center
  # Browser
  # chromium-browser firefox

  # for virtualbox or in virtualbox Container
  if [[ -n "$(command -v vbox-img)" ]]; then
    apt install --no-install-recommends linux-headers-$(uname -r) linux-tools-$(uname -r)
    # for build virtualbox enhance feature (Guest addition cd image)
    apt install --no-install-recommends gcc make perl
  fi
}
