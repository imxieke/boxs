#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-09-12 22:14:17
 # @LastEditTime: 2026-01-06 19:22:59
 # @LastEditors: Cloudflying
# @Description:
###

_install()
{
  # pkgfile pacman .files metadata explorer
  pacman -S --noconfirm pkgfile

  # App Store
  # Not found webapp-manager-manjaro apper
  pacman -S --noconfirm gnome-software deepin-store \
    pamac-cli pamac-gtk pamac-tray-icon-plasma \
    octopi

  # Tools
  # flameshot screenshot
  # shutter screenshot
  # jp2a A small utility for converting JPG images to ASCII
  # d-feet D-Bus debugger for GNOME
  # vokoscreen 录屏
  # gnome-multi-writer Write an ISO file to multiple USB devices at once
  # kmouth 语音合成
  # kmousetool 似乎是鼠标自动化
  # kmag 屏幕放大器
  # ksnip cross-platform screenshot and annotation tool
  pacman -S --noconfirm psmisc flameshot shutter jp2a d-feet kweather \
    marble-maps \
    activity-log-manager vokoscreen \
    gnome-multi-writer \
    kmouth kmousetool kmag \
    bitwarden \
    ksnip

  # Productive
  # geary Mail CLient
  # endeavour TODO
  # sticky 便签
  pacman -S --noconfirm geary endeavour sticky

  # System Tools
  # tmon Monitoring and Testing Tool for Linux kernel thermal subsystem
  # perf Linux kernel performance auditing tool
  # sysprof Kernel based performance profiler
  # onboard 虚拟键盘
  # systemdgenie Systemd management utility
  # drkonqi The KDE crash handler
  # imagewriter A graphical utility for writing raw disk images & hybrid isos to USB keys
  pacman -S --noconfirm tmon perf sysprof systemdgenie drkonqi imagewriter pacmanlogviewer

  # Aur: etcher
  # Deepin Family
  # deepin-system-monitor replace by kde system monitor
  # deepin-voice-note 若有一天改用物理机 则是它重见天日之日
  pacman -S --noconfirm \
    deepin-album \
    deepin-calendar \
    deepin-calculator \
    deepin-clone \
    deepin-compressor \
    deepin-draw \
    deepin-diskmanager \
    deepin-editor \
    deepin-font-manager \
    deepin-image-viewer \
    deepin-mail \
    deepin-movie \
    deepin-music \
    deepin-picker \
    deepin-printer \
    deepin-reader \
    deepin-screen-recorder

  # MDZZ 这个缺少 但不会被作为依赖安装
  pacman -S --noconfirm deepin-qt-dbus-factory

  # File
  # easytag Simple application for viewing and editing tags in audio files
  # meld visual diff and merge tool for files, folders and version control.
  # File Manager: nautilus
  # bulky Rename multiple files at once.
  pacman -S --noconfirm diffutils easytag meld nautilus gnome-disk-utility kdiff3 bulky

  # Database Client
  pacman -S --noconfirm sqlitebrowser

  # Chat
  # aur slack-desktop
  # fractal Matrix messaging client
  # hexchat A popular and easy to use graphical IRC (chat) client
  # polari An IRC Client for GNOME
  pacman -S --noconfirm discord fractal hexchat polari

  # Third Party Terminal
  pacman -S --noconfirm \
    mate-terminal \
    deepin-terminal \
    gnome-terminal

  # Documents
  # yelp views Mallard, DocBook, man, info, and HTML documents
  # xreader Document viewer for files like PDF and Postscript
  pacman -S --noconfirm calibre \
    evince \
    pdfmod \
    yelp yelp-tools yelp-xsl \
    gnome-books \
    xreader \
    xfce4-dict \
    okular

  # BitTorrent && Downloader
  pacman -S --noconfirm deluge qbittorrent ktorrent transmission-gtk uget

  # Productive Video && Audio Editor
  # pitivi Editor for audio/video projects using the GStreamer framework, beautiful and intuitive
  # pro-audio 音频剪辑等软件包群组 一键安装常用剪辑软件
  pacman -S --noconfirm pitivi

  # Security
  # Rustscan Port Scanner
  pacman -S --noconfirm metasploit ghidra jadx rustscan

  # Scanner 打印机
  # pacman -S --noconfirm simple-scan

  # Editor
  # gtk markdown editor
  # ghostwriter MarkDown
  # xed 文本编辑器
  pacman -S --noconfirm code kate marker ghex gnome-builder xed ghostwriter gnome-text-editor \
    gedit gedit-plugins

  # Wine
  pacman -S --noconfirm wine vkd3d wine-gecko winetricks wine-mono
  # Wine Depends
  pacman -S --noconfirm lib32-sdl2 lib32-pcsclite lib32-libcups lib32-alsa-plugins lib32-gnutls lib32-gst-plugins-base \
    lib32-libxcomposite

  # Pictures
  # picture view: ristretto pix
  # shotwell A digital photo organizer designed for the GNOME desktop environment
  # xviewer Fast and functional graphics viewer
  pacman -S --noconfirm nomacs ristretto pix gthumb eog shotwell digikam gnome-photos photoflare \
    xviewer xviewer-plugins

  # MultiMedia Player
  # smplayer Media player with built-in codecs that can play virtually all video and audio formats
  pacman -S --noconfirm vlc \
    kmplayer \
    mpv \
    dragon \
    smplayer \
    smplayer \
    celluloid \
    gnome-subtitles \
    totem \
    haruna

  # Music Player
  # lollypop Music player for GNOME
  # rhythmbox A GTK client for MPD inspired by Rhythmbox but much lighter and faster
  pacman -S --noconfirm gnome-music lollypop rhythmbox

  # Development
  # 下面两个用暂时不到
  # sagemath Open Source Mathematics Software, free alternative to Magma, Maple, Mathematica, and Matlab
  # sagemath matplab 开源替代品
  # qtcreator Lightweight, cross-platform integrated development environment
  # pacman -S --noconfirm sagemath qtcreator
  pacman -S --noconfirm kommit kdesvn

  # Electron
  pacman -S --noconfirm asar electron electron18

  # Databases
  # kexi A visual database applications creator
  # dbeaver Free universal SQL Client for developers and database administrators (community edition) java
  pacman -S --noconfirm mysql-workbench kexi \
    dbeaver dbeaver-plugin-office

  # Games
  # 不玩游戏 谢谢
  # steam 滚啊
  # lutris 开源游戏平台
  # gnome-games gnome 游戏客户端
  # gnome-nibbles 类似贪吃蛇
  # pacman -S --noconfirm lutris
  # iagno 五子棋
  # hitori 数字扫雷
  # gnome-taquin 散乱图片组成完整的游戏
  # gnome-sudoku
  pacman -S --noconfirm gnome-games \
    gnome-2048 gnome-robots gnome-nibbles atomix five-or-more gnome-klotski gnome-mines gnome-nibbles gnome-chess \
    gnome-sudoku gnome-taquin gnome-tetravex gnome-tetravex gnome-taquin gnome-robots \
    tali lightsoff swell-foop iagno hitori quadrapassel

  # Browser
  # aur tor-browser edge google-chrome
  pacman -S --noconfirm \
    vivaldi vivaldi-ffmpeg-codecs \
    firefox firefox-i18n-zh-cn \
    firefox-developer-edition firefox-developer-edition-i18n-zh-cn \
    chromium \
    falkon

  # Password Manager
  # seahorse managing PGP keys
  pacman -S --noconfirm seahorse

  # Office
  # libreoffice-fresh beta version
  # pacman -S --noconfirm libreoffice-fresh libreoffice-fresh-zh-cn libreoffice-extension-texmaths libreoffice-extension-writer2latex

  # NetWork
  # smb4k 功能强大的网上邻居浏览器和 Samba 共享挂载工具
  pacman -S --noconfirm gnome-nettool smb4k

  # Firewall
  pacman -S --noconfirm gufw

  # KDE Plasma Desktop
  # pacman -S --noconfirm plasma

  # KDE Applications
  pacman -S --noconfirm kde-graphics \
    kde-multimedia \
    kde-network \
    kde-pim \
    kde-system \
    kde-utilities \
    kde-games \
    kde-applications

  pacman -S --noconfirm dolphin-plugins

  # Theme Tools
  pacman -S --noconfirm kvantum kvantum-manjaro

  # SDDM 仅对于非 sddm 桌面环境管理器
  # pacman -S --noconfirm sddm sddm-kcm
  # systemctl enable sddm.service

  # Deepin Desktop
  # pacman -S --noconfirm deepin deepin-extra deepin-kwin

  # Gnome Apps
  # sushi A quick previewer for Nautilus
  pacman -S --noconfirm baobab eog epiphany evince file-roller gnome-font-viewer gnome-maps gnome-weather rygel sushi

  # ElementaryOS Desktop conflict with Deepin Desktop
  # pacman -S --noconfirm pantheon
  # pacman -S --noconfirm xfce4 xfce4-goodies

  # Kernel
  pacman -S --noconfirm linux-firmware linux-api-headers

  # Productive
  # thingy TODO List
  # pacman -S --noconfirm thunderbird thunderbird-i18n-zh-cn thingy

  # Input Method
  pacman -S --noconfirm fcitx fcitx-configtool fcitx-sogoupinyin

  # 修复缺失库
  pacman -S --noconfirm libvoikko nuspell hspell

  # 指纹 Fingerprint
  # fingwit 指纹配置
  # pacman -S --noconfirm fingwit

  # pacman -S --noconfirm fcitx5 fcitx5-configtool fcitx5-chinese-addons

  # xorg
  pacman -S --noconfirm xorg xorg-apps
  pacman -S --noconfirm xdg-utils

  # KDE Application
  # labplot graphing and analysis of scientific data
  # kdenlive A non-linear video editor for Linux using the MLT video framework
  # ksysguard System Monitor
  # kile A user friendly TeX/LaTeX frontend for KDE
  # okteta hex editor for viewing and editing the raw data
  # krusader Advanced twin panel (commander style) file manager
  # calligra A set of applications for productivity and creative usage
  # index-fm Multi-platform file manager
  # apper An application and package manager using PackageKit
  # pikasso Image gallery application
  # alligator RSS Feed Reader
  # pix Image viewer and browser based on gthumb
  # kclock Simple Clock application for Mobile Devices running Plasma
  # kalk Cross-platfrom calculator built with the Kirigami framework
  # kweather Weather App
  # calligra-plan A project management application intended for managing moderately large projects with multiple resources
  # kbibtex An editor for bibliographies used with LaTeX
  # aur: pikasso
  # TODO: 待研究 似乎不是全部都有用
  # not found apper
  pacman -S --noconfirm labplot kdenlive kdevelop kile okteta krusader calligra index-fm \
    alligator pix kclock kalk kweather calligra-plan kbibtex kde-cli-tools

  # 图像处理 3D 建模等
  # blender 创建 3D 模型和动画场景
  # inkscape 矢量图形编辑器
  # darktable Utility to organize and develop raw images
  # openshot 简单的视频编辑器。添加视频、照片和音乐以创建 DVD、YouTube 剪辑和一系列其他格式。
  # shotcut Video Editor
  # krita Edit and paint images
  # pikopixel(aur) 绘制和编辑像素艺术图像
  # pinta 免费的开源程序，用于绘图和图像编辑
  # rnote 一款基于矢量的开源绘图应用程序，用于素描、手写笔记以及注释文档和图片
  # librecad A 2D CAD drawing tool based on the community edition of QCad
  # drawing simple image editor (similar to MS Paint)
  # krita 数字绘图
  pacman -S --noconfirm inkscape \
    openshot \
    shotcut \
    blender \
    gimp gimp-help-zh_cn gimp-plugin-gmic \
    krita \
    darktable \
    pinta \
    rnote \
    librecad \
    drawing \
    krita

  # gmic GREYC's Magic Image Converter: image processing framework
  # pacman -S --noconfirm gmic

  # App Store
  pacman -S --noconfirm discover

  # Disk Utils
  pacman -S --noconfirm gpart gparted parted

  # remmina remote desktop client written in GTK+
  pacman -S --noconfirm remmina gnome-connections filezilla vinagre teamviewer

  # Android
  pacman -S --noconfirm android-tools

  # Fonts
  # noto-fonts google noto fonts
  # ttf-ubuntu-font-family: Ubuntu Mono
  pacman -S --noconfirm adobe-source-code-pro-fonts adobe-source-han-sans-cn-fonts adobe-source-han-serif-cn-fonts \
    ttf-jetbrains-mono \
    wqy-microhei wqy-zenhei \
    noto-fonts \
    nerd-fonts-noto-sans-mono \
    ttf-fira-code ttf-fira-mono ttf-ubuntu-font-family

  # Tools
  # figlet making large letters out of ordinary text
  # asciiquarium 数字海洋馆
  # sl ASCII 小火车
  # see hardware info
  # peek GIF screen recorder
  pacman -S --noconfirm figlet asciiquarium sl dmidecode sshfs supervisor \
    gnome-logs gnome-calculator gnome-dictionary ocrfeeder peek gnome-podcasts \
    mdcat


  # Characters 字符
  pacman -S --noconfirm gnome-characters

  # Calendar
  pacman -S --noconfirm gnome-calendar

  # Backup
  pacman -S --noconfirm timeshift

  pacman -S --noconfirm qt6-base  qt6-3d \
    qt6-wayland

  # 镜像烧录
  # xfburn brasero gnome-multi-writer

  # Virtual Machine && Container
  # gnome-boxes
  # use kernel version
  # pacman -S --noconfirm \
  # docker \
  # libvirt \
  # qemu-system-x86 qemu-virtiofsd

  # VirtualBox 如果在 Linux 类系统完全没必要安装虚拟机
  # pacman -S --noconfirm virtualbox virtualbox-guest-utils virtualbox-host-dkms linux518-virtualbox-host-modules
  # 仅运行在vbox虚拟机内
  # systemctl enable vboxservice.service
}

_install
