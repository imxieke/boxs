#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-08-15 13:54:32
 # @LastEditTime: 2025-03-27 17:20:47
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
# winget install --accept-package-agreements Kingsoft.WPSOffice.CN

# Terminal
# Flutter Treminal
# winget install --accept-package-agreements 9P2KRLMFXF9T
# Windows Terminal
winget install --accept-package-agreements 9N0DX20HK701
# Windows Terminal Preview
# winget install --accept-package-agreements 9N8G5RFZ9XK3

winget install JanDeDobbeleer.OhMyPosh -s winget

winget install Telegram.TelegramDesktop
winget install Microsoft.PowerToys
# winget install Microsoft.devtunnel
winget install Microsoft.PowerShell
# Install-Module -Name Microsoft.WinGet.Client

# Microsoft PC Manager
winget install --accept-package-agreements 9PM860492SZD
# Microsoft Remote Desktop
# winget install --accept-package-agreements 9WZDNCRFJ3PS
# Microsoft Whiteboard
winget install --accept-package-agreements 9MSPC6MP8FM4

# 火绒
winget install --accept-package-agreements XPDNH1FMW7NB40

winget install Microsoft.OneDrive
# winget install Tencent.WeCom
# winget install Tencent.WeCom
winget install Iterate.Cyberduck
winget install Ruihu.Apifox

# winget install Mozilla.Thunderbird

winget install Apple.iTunes
winget install Apple.iCloud
# winget install Xiaomi.XiaomiCloud
# winget install Git.Git
# winget install GitHub.cli
# winget install GitHub.GitLFS
# winget install dandavison.delta
# winget install Baidu.BaiduPinyin

# winget install Chocolatey.Chocolatey

winget install Microsoft.DotNet.DesktopRuntime.8
winget install Microsoft.DotNet.DesktopRuntime.9
winget install Microsoft.DotNet.Runtime.8
winget install Microsoft.DotNet.Runtime.9
winget install Microsoft.DotNet.SDK.8
winget install Microsoft.DotNet.SDK.9
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
winget install Microsoft.VCRedist.2005.x64
winget install Microsoft.VCRedist.2005.x86
winget install Microsoft.WindowsAppRuntime.1.5
winget install Microsoft.WindowsAppRuntime.1.6
winget install Microsoft.DotNet.Framework.DeveloperPack_4

winget install EclipseAdoptium.Temurin.21.JDK
winget install EclipseAdoptium.Temurin.21.JRE

# Nuget Package Manager
winget install Microsoft.NuGet

# Network
winget install ISC.Bind
# Microsoft Network Monitor
# winget install Microsoft.NetMon

# Remote Tunnel Access
winget install Cloudflare.cloudflared

# Remote
# winget install RustDesk.RustDesk
# winget install TeamViewer.TeamViewer
winget install Youqu.ToDesk
winget install Cloudflare.cloudflared

# winget install FilesCommunity.Files
winget install CoreyButler.NVMforWindows

# Launcher Tools
winget install Flow-Launcher.Flow-Launcher
# Fluent Search
winget install BlastApps.FluentSearch

# Program
winget install Python.Python.3.12
# winget install Rustlang.Rustup
winget install GoLang.Go

# Sound Editor
# winget install FxSound.FxSound

# Drive
winget install 123.123pan
winget install Alibaba.QuarkCloudDrive
winget install Alibaba.aDrive
winget install Apple.iCloud
# winget install Google.GoogleDrive
# winget install Xiaomi.XiaomiCloud
# winget install Rclone.Rclone
# winget install AList.AList

# Dict && Translate
winget install Youdao.YoudaoTranslate

# Tools
# winget install voidtools.Everything.Alpha

# Chat
winget install Tencent.WeChat

# App Store
winget install --exact --id MartiCliment.UniGetUI --source winget