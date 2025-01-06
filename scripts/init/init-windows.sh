#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-08-15 13:54:32
 # @LastEditTime: 2025-01-06 23:53:29
 # @LastEditors: Cloudflying
# @Description: MinGW
###

winget source remove winget
# https://storeedgefd.dsx.mp.microsoft.com/v9.0 msstore
# https://cdn.winget.microsoft.com/cache
winget source add winget https://mirrors.ustc.edu.cn/winget-source --trust-level trusted
# Reset
# winget source reset winget

winget install Google.Chrome.EXE
winget install Microsoft.Edge
winget install Vivaldi.Vivaldi
winget install Mozilla.Firefox.DeveloperEdition

# Office 365
winget install --accept-package-agreements 9WZDNCRD29V9
winget install Kingsoft.WPSOffice.CN

# Terminal
# Flutter Treminal
winget install --accept-package-agreements 9P2KRLMFXF9T
# Windows Terminal
winget install --accept-package-agreements 9N0DX20HK701
# Windows Terminal Preview
winget install --accept-package-agreements 9N8G5RFZ9XK3

winget install JanDeDobbeleer.OhMyPosh -s winget

winget install Telegram.TelegramDesktop
winget install Microsoft.PowerToys
winget install Microsoft.devtunnel
winget install Microsoft.PowerShell
# Install-Module -Name Microsoft.WinGet.Client

# Microsoft PC Manager
winget install --accept-package-agreements 9PM860492SZD
# Microsoft Remote Desktop
winget install --accept-package-agreements 9WZDNCRFJ3PS
# Microsoft Whiteboard
winget install --accept-package-agreements 9MSPC6MP8FM4

# Remote Tunnel Access
winget install Cloudflare.cloudflared

# 火绒
winget install --accept-package-agreements XPDNH1FMW7NB40

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
# winget install Git.Git
# winget install GitHub.cli
# winget install GitHub.GitLFS
# winget install dandavison.delta
winget install Baidu.BaiduPinyin

winget install Chocolatey.Chocolatey

winget install Microsoft.DotNet.DesktopRuntime.8
winget install Microsoft.DotNet.DesktopRuntime.9
winget install Microsoft.DotNet.Runtime.8
winget install Microsoft.DotNet.Runtime.9
winget install Microsoft.VCRedist.2015+.x86
winget install Microsoft.VCRedist.2015+.x64
winget install Microsoft.VCRedist.2013.x64
winget install Microsoft.VCRedist.2013.x86
winget install Microsoft.VCRedist.2012.x64
winget install Microsoft.VCRedist.2012.x86
winget install Microsoft.VCRedist.2010.x64
winget install Microsoft.VCRedist.2010.x86
winget install Microsoft.VCRedist.2008.x64
winget install Microsoft.VCRedist.2008.x86
winget install Microsoft.WindowsAppRuntime.1.5

# Nuget Package Manager
winget install Microsoft.NuGet
# Microsoft Network Monitor
winget install Microsoft.NetMon

winget install FilesCommunity.Files
winget install CoreyButler.NVMforWindows
