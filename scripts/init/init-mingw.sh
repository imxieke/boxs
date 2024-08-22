#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-08-15 13:54:32
# @LastEditTime: 2024-08-22 17:54:39
# @LastEditors: Cloudflying
# @Description: MinGW
###

winget install Google.Chrome.EXE
winget install Microsoft.Edge
winget install Vivaldi.Vivaldi
winget install Mozilla.Firefox.DeveloperEdition

# Office 365
winget install 9WZDNCRD29V9
winget install Kingsoft.WPSOffice.CN

# Terminal
# Flutter Treminal
winget install 9P2KRLMFXF9T
# Windows Terminal
winget install 9N0DX20HK701

# 火绒
winget install XPDNH1FMW7NB40

# Windows Terminal Preview
winget install 9N8G5RFZ9XK3
# Flutter Terminal
winget install 9P2KRLMFXF9T

winget install Microsoft.OneDrive
winget install Tencent.WeCom
winget install Youqu.ToDesk
winget install Tencent.WeCom
winget install Iterate.Cyberduck
winget install Ruihu.Apifox
winget install Alibaba.QuarkCloudDrive

winget install Mozilla.Thunderbird

winget install Apple.iTunes
winget install Apple.iCloud
winget install Xiaomi.XiaomiCloud
winget install Git.Git
winget install GitHub.cli
# winget install GitHub.GitLFS
winget install dandavison.delta
winget install Baidu.BaiduPinyin

winget install Iterate.Cyberduck
winget install Microsoft.DotNet.DesktopRuntime.8

pacman -S --noconfirm mingw-w64-x86_64-neovim
pacman -S --noconfirm rsync

pacman -S --noconfirm git \
    mingw-w64-x86_64-bat \
    mingw-w64-x86_64-git-lfs \
    mingw-w64-x86_64-delta \
    mingw-w64-x86_64-gitui \
    mingw-w64-x86_64-github-cli
