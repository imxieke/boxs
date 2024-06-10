#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-09-17 20:02:52
# @LastEditTime: 2024-06-08 10:37:54
# @LastEditors: Cloudflying
# @Description: init package for macOS brew package manager
###

# 初始化 brew 使用 大陆镜像 提高下载速度
init_brew() {
  # https://mirrors.cloud.tencent.com/homebrew/
  # http://mirrors.ustc.edu.cn/
  [ -z "$(command -v brew)" ] && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  if [[ -n "$(command -v brew)" ]]; then
    echo "==> Set Brew and tap mirrors"
    # Brew
    git -C "$(brew --repo)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/brew.git

    # Cask
    if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask ]]; then
      git -C "$(brew --repo homebrew/cask)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
    else
      brew tap homebrew/cask https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask.git
    fi

    # Core
    if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-core ]]; then
      # trunk-ignore(shellcheck/SC2312)
      git -C "$(brew --repo homebrew/core)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
    else
      brew tap homebrew/core https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-core.git
    fi

    if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-services ]]; then
      git -C "$(brew --repo homebrew/services)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-services.git
    else
      brew tap homebrew/services https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-services.git
    fi

    if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-versions ]]; then
      git -C "$(brew --repo homebrew/cask-versions)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-versions.git
    else
      brew tap homebrew/cask-versions https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-versions.git
    fi

    if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-versions ]]; then
      git -C "$(brew --repo homebrew/cask-versions)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-command-not-found.git
    else
      brew tap homebrew/cask-versions https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-command-not-found.git
    fi

    # Deprecated
    # if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-drivers ]]; then
    # 	git -C "$(brew --repo homebrew/cask-drivers)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git
    # else
    # 	brew tap homebrew/cask-drivers https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-drivers.git
    # fi

    if [[ -d /usr/local/Homebrew/Library/Taps/homebrew/homebrew-cask-fonts ]]; then
      git -C "$(brew --repo homebrew/cask-fonts)" remote set-url origin https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
    else
      brew tap homebrew/cask-fonts https://mirrors.tuna.tsinghua.edu.cn/git/homebrew/homebrew-cask-fonts.git
    fi
    # git branch --set-upstream-to=origin/master master

    # Remove a formula and its unused dependencies
    # brew tap beeftornado/rmtree
    # brew tap symfony-cli/homebrew-tap
  fi
}

init_pkgs() {
  # System Depency
  brew install coreutils

  # Dev
  brew install gcc make cmake xmake autoconf automake

  # System Resource Monitor
  brew install htop

  # Version Control
  # gitleaks: detetct secret data leaks
  # gitui: Blazing 💥 fast terminal-ui for git written in rust 🦀
  # git-delta: A syntax-highlighting pager for git, diff, and grep output
  # ghq: Remote repository management made easy
  brew install git git-lfs git-svn gitleaks subversion gh gitui git-delta lazygit ghq

  # lsd rust The next gen ls command
  # exa rust Modern replacement for ls
  # fd  rust Simple, fast and user-friendly alternative to find
  # fzf Command-line fuzzy finder written in Go
  # duf Disk Usage/Free Utility - a better 'df' alternative
  # ripgrep recursively searches directories for a regex pattern while respecting your gitignore
  brew install tree lsd exa fd duf fzf ripgrep ripgrep-all the_silver_searcher

  # bitwarden Password Manager
  # balenaetcher flash mirror file to disk or Removable disk
  brew install bitwarden-cli balenaetcher

  # Compress
  brew install unar unzip xz zstd brotli

  # File Content View
  # sk skim fuzzy file search
  # glow markdown preview
  brew install rga \
    ccat bat bat-extras mdcat sk glow

  # Remote
  # devtunnel Microsoft tunnel
  brew install vnc-viewer telnet cloudflared devtunnel tailscale

  # gron Make JSON greppable!
  brew install jq ccat gron ctop grex sd xsv jo

  # Database
  brew install mysql@5.7 redis sqlite

  # Database Client
  brew dbeaver-community

  # Lint
  brew dotenv-linter

  # Tools
  # grc Colorize logfiles and command output
  # fortune show quotes
  brew install zsh meofetch squashfs whois cowsay grc fortune procs supervisor syft

  # Server
  brew install openssh

  # ntfs
  # brew install mounty

  # MultiMedia
  brew install iina \
    qqplayer qqmusic neteasemusic kugoumusic \
    ffmpeg imagemagick

  # input
  brew install sogouinput

  # Transfer
  brew install mountain-duck cyberduck

  # Dict && Translation
  brew install eudic easydict

  # News && Feed
  brew install netnewswire

  # Network Tools
  # cli dns query
  # bandwhich Terminal bandwidth utilization tool
  # doggo dog dns client
  brew install curl clash whois iperf iperf3 netcat socat \
    dog doggo \
    syncthing rsync rclone \
    bandwhich

  # Chat
  brew install telegram wechat qq discord

  # Fonts
  brew install font-fontawesome font-fira-mono-nerd-font font-hack-nerd-font font-jetbrains-mono-nerd-font font-mononoki-nerd-font \
    font-noto-color-emoji font-noto-emoji font-ubuntu-mono-nerd-font font-ubuntu-nerd-font

  # duti Select default apps for documents and URL schemes on macOS
  # mas macos app store interface
  brew install duti mas

  # Downloader
  # free-download-manager
  brew install wget axel aria2 motrix youtube-dl

  # Programming language
  # go node python python2 python3 pip pip2 pip3 php composer ruby perl java
  brew install shivammathur/php/php \
    go \
    python \
    dotnet \
    kotlin \
    openjdk \
    node@20 \
    deno

  brew install shivammathur/php/php@7.4 shivammathur/extensions/amqp@7.4 shivammathur/extensions/event@7.4 shivammathur/extensions/grpc@7.4 shivammathur/extensions/imagick@7.4 shivammathur/extensions/imap@7.4 shivammathur/extensions/mcrypt@7.4 shivammathur/extensions/memcache@7.4 shivammathur/extensions/memcached@7.4 shivammathur/extensions/mongodb@7.4 shivammathur/extensions/msgpack@7.4 shivammathur/extensions/phalcon5@7.4 shivammathur/extensions/protobuf@7.4 shivammathur/extensions/rdkafka@7.4 shivammathur/extensions/redis@7.4 shivammathur/extensions/snmp@7.4 shivammathur/extensions/ssh2@7.4 shivammathur/extensions/swoole@7.4 shivammathur/extensions/vips@7.4 shivammathur/extensions/xlswriter@7.4 shivammathur/extensions/yaml@7.4 shivammathur/extensions/zmq@7.4 shivammathur/extensions/apcu@7.4

  brew install shivammathur/php/php@8.0 shivammathur/extensions/amqp@8.0 shivammathur/extensions/event@8.0 shivammathur/extensions/imagick@8.0 shivammathur/extensions/imap@8.0 shivammathur/extensions/mcrypt@8.0 shivammathur/extensions/memcache@8.0 shivammathur/extensions/memcached@8.0 shivammathur/extensions/mongodb@8.0 shivammathur/extensions/msgpack@8.0 shivammathur/extensions/phalcon5@8.0 shivammathur/extensions/protobuf@8.0 shivammathur/extensions/rdkafka@8.0 shivammathur/extensions/redis@8.0 shivammathur/extensions/snmp@8.0 shivammathur/extensions/ssh2@8.0 shivammathur/extensions/swoole@8.0 shivammathur/extensions/vips@8.0 shivammathur/extensions/xlswriter@8.0 shivammathur/extensions/yaml@8.0 shivammathur/extensions/zmq@8.0 shivammathur/extensions/apcu@8.0

  brew install shivammathur/php/php@8.1 shivammathur/extensions/amqp@8.1 shivammathur/extensions/event@8.1 shivammathur/extensions/grpc@8.1 shivammathur/extensions/imagick@8.1 shivammathur/extensions/imap@8.1 shivammathur/extensions/mcrypt@8.1 shivammathur/extensions/memcache@8.1 shivammathur/extensions/memcached@8.1 shivammathur/extensions/mongodb@8.1 shivammathur/extensions/msgpack@8.1 shivammathur/extensions/phalcon5@8.1 shivammathur/extensions/protobuf@8.1 shivammathur/extensions/rdkafka@8.1 shivammathur/extensions/redis@8.1 shivammathur/extensions/ssh2@8.1 shivammathur/extensions/swoole@8.1 shivammathur/extensions/vips@8.1 shivammathur/extensions/xlswriter@8.1 shivammathur/extensions/yaml@8.1 shivammathur/extensions/zmq@8.1 shivammathur/extensions/apcu@8.1

  brew install shivammathur/php/php@8.2 shivammathur/extensions/event@8.2 shivammathur/extensions/grpc@8.2 shivammathur/extensions/imagick@8.2 shivammathur/extensions/imap@8.2 shivammathur/extensions/mcrypt@8.2 shivammathur/extensions/memcached@8.2 shivammathur/extensions/mongodb@8.2 shivammathur/extensions/msgpack@8.2 shivammathur/extensions/phalcon5@8.2 shivammathur/extensions/protobuf@8.2 shivammathur/extensions/rdkafka@8.2 shivammathur/extensions/redis@8.2 shivammathur/extensions/swoole@8.2 shivammathur/extensions/xlswriter@8.2 shivammathur/extensions/yaml@8.2 shivammathur/extensions/zmq@8.2 shivammathur/extensions/apcu@8.2

  # Language Server Protocol
  brew install lua-language-server \
    kotlin-language-server \
    gopls \
    elixir-ls

  # Options
  # brew install swift ruby@2.7 rust kotlin node@16
  # brew install --cask dotnet dotnet-sdk
  # Programming language Tools
  # brew install composer
  # Editor and IDE
  brew install neovim zed \
    visual-studio-code vscodium \
    sublime-text@dev \
    android-studio \
    intellij-idea
  # phpstorm webstorm rider fleet pycharm clion appcode datagrip

  # Web Browser
  brew install google-chrome firefox-developer-edition chromium microsoft-edge tor-browser

  # Dev
  # Android Tools
  brew install android-platform-tools android-sdk

  # Formatter
  brew install shfmt yamlfmt stylua

  # Terminal
  brew install iterm2

  # export windows package file lists (.exe)
  brew install innoextract

  # Documents && Markdown
  brew install mdv mdp koodo-reader \
    pandoc pandoc-plot \
    tldr

  # Virtual Box
  # brew install virtualbox vagrant lima podman qemu multipass

  # System Tools
  brew install tencent-lemon

  # Security Tools
  # snyk-cli Scans and monitors projects for security vulnerabilities
  brew install aircrack-ng wifi-password nmap sqlmap massdns snyk-cli

  # Finance
  brew install tradingview

  # Utils
  brew install universal-ctags

  # Download form App Store
  # 944848654 Netease Music
  # 1352778147 BitWarden
  # 747648890 Telegram
  # 451108668 QQ
  # 1119452668 Kuwo
  # 1443749478 Wps
  # 1314842898 Tencent Kantu PicView
  # 408981434 iMovie
  # 409183694 KeyNote
  # 409203825 Numbers
  # 409201541 Pages
  # 836500024 WeChat
  mas install 944848654 1352778147 747648890 451108668 1119452668 1443749478 1314842898 408981434 409183694 409203825 409201541 836500024
}

init_bin() {
  # Use AirPlay to stream to UPnP/Sonos & Chromecast devices
  if [[ ! -f ~/.bin/aircast ]]; then
    echo "==> Fetch AirCast"
    curl -sL https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/aircast-osx-multi --output ~/.bin/aircast
  fi

  if [[ ! -f ~/.bin/airupnp ]]; then
    echo "==> Fetch AirUpnp"
    curl -sL https://raw.githubusercontent.com/philippe44/AirConnect/master/bin/airupnp-osx-multi --output ~/.bin/airupnp
  fi

  if [[ ! -f ~/.bin/speedtest ]]; then
    echo "==> Fetch ookla speedtest.net cli speed test for macOS"
    curl -sL https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-macosx-x86_64.tgz | tar -C ~/.bin/ -xvf - speedtest
  fi
}
