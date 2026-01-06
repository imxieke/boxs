#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:13:06
 # @LastEditTime: 2026-01-06 19:20:34
 # @LastEditors: Cloudflying
# @Description: manjaro contains all archlinux packages, but archlinux has many packages that do not exist
###

_install()
{
  # Dev
  pacman -S --noconfirm base-devel cmake cppcheck gdb clang lld \
    mingw-w64-gcc \
    tree-sitter \
    tree-sitter-bash \
    tree-sitter-c \
    tree-sitter-cli \
    tree-sitter-javascript \
    tree-sitter-lua \
    tree-sitter-markdown \
    tree-sitter-python \
    tree-sitter-query \
    tree-sitter-rust

  # Libarary
  pacman -S --noconfirm libpng \
    libheif \
    libjxl \
    libwmf \
    libxml2 \
    libjpeg-turbo \
    libavif \
    webkit2gtk-4.1 \
    webkit2gtk \
    appmenu-gtk-module \
    gtk3 \
    libappindicator-gtk3 \
    librsvg

  # Compress
  # GUI Archive: file-roller
  pacman -S --noconfirm arj bzip2 bzip3 cdrtools cpio lhasa rpmextract unzip unarchiver gzip tar p7zip unrar \
    lzip lrzip xz zip \
    zstd \
    squashfs-tools unace

  # Network
  # openbsd-netcat: nc command
  # corkscrew: tunneling SSH through HTTP proxies
  # bandwhich Terminal bandwidth utilization tool
  pacman -S --noconfirm net-tools mtr traceroute dnsutils iputils lsof \
    bandwhich \
    clash \
    syncthing rsync rclone \
    whois \
    openbsd-netcat corkscrew socat \
    iperf iperf3

  # Language
  # Replace With nvm to install nodejs npm
  pacman -S --noconfirm python python-pip \
    go \
    jdk-openjdk \
    php \
    deno \
    lua \
    ruby

  # Rust
  pacman -S --noconfirm rustup \
    rust-analyzer \
    rust-bindgen

  # Python Packages
  pacman -S --noconfirm python-pipx \
    python-beautifulsoup4 \
    python-cchardet \
    python-chardet \
    python-lxml \
    python-html5lib

  # Language Server Protocol
  pacman -S --noconfirm gopls stylua

  # Database
  pacman -S --noconfirm mariadb-clients

  # Program Tools
  pacman -S --noconfirm composer luarocks

  # System Utils
  pacman -S --noconfirm procps-ng jwt-cli

  # File && Code Tools
  # rg A search tool that combines the usability of ag with the raw speed of grep
  # ag Code searching tool similar to Ack, but faster
  # # duf Disk Usage/Free Utility
  # ripgrep-all ripgrep, but also search in PDFs, E-Books, Office documents, zip, tar.gz, etc.
  # chafa 📺🗿 Terminal graphics for the 21st century.
  pacman -S --noconfirm ripgrep the_silver_searcher duf fzf ripgrep-all chafa

  # Tools
  # flameshot screenshot
  # shutter screenshot
  # jp2a A small utility for converting JPG images to ASCII
  # d-feet D-Bus debugger for GNOME
  # asciinema Record and share terminal sessions
  # skim Fuzzy Finder in Rust
  # vokoscreen 录屏
  # syft generating a Software Bill of Materials from container images and filesystems
  # Disk usage analyzer with an ncurses interface
  # xsv A CLI for indexing, slicing, analyzing, splitting and joining CSV files
  # sysstat a collection of performance monitoring tools (iostat,isag,mpstat,pidstat,sadf,sar)
  # glow markdown preview
  # yazi Blazing fast terminal file manager written in Rust, based on async I/O
  pacman -S --noconfirm tree jq sudo file less zsh btop htop \
    cowsay cowfortune lolcat \
    lsb-release ntp mtools xsv eza \
    skim fd \
    asciinema \
    gron \
    bat bat-extras \
    syft ncdu \
    sysstat \
    glow \
    yazi

  # Package management
  # App Store
  # snapd yay not in Archlinux
  # pacman -S --noconfirm dpkg pacman-mirrors yay

  # Media
  pacman -S --noconfirm ffmpeg

  # Documents
  # So Large pandoc-cli pandoc-plot
  pacman -S --noconfirm poppler poppler-data

  # Security
  # osv-scanner Vulnerability scanner
  # trivy A Simple and Comprehensive Vulnerability Scanner for Containers
  pacman -S --noconfirm nmap rustscan osv-scanner sqlmap masscan trivy

  # Virtual Machine && Container
  # Docker
  pacman -S --noconfirm docker docker-buildx docker-compose docker-scan docker-machine
  # podman-docker conflict with docker
  # pacman -S --noconfirm podman podman-compose podman-docker

  # Virtual Machine && Container Depency
  # pacman -S --noconfirm fuse-overlayfs

  # Image Process
  pacman -S --noconfirm graphicsmagick jasper ghostscript

  # OCR
  pacman -S --noconfirm tesseract tesseract-data-chi_sim

  # Docker Tools
  # ctop like linux top
  # crun replace runc, crun is faster than runc and has a much lower memory footprint.
  # podman --runtime /usr/bin/crun run --rm --memory 4M fedora echo it works
  # cosign sign container image
  # dive A tool for exploring each layer in a docker image
  # skopeo Work with remote images registries - retrieving information, images, signing content
  pacman -S --noconfirm ctop container-diff crun cosign dive skopeo

  # Git Tools
  # onefetch: like neofetch but for git
  # gitg GUI client to view git repositories.
  pacman -S --noconfirm tcl tk # depend by git gui
  pacman -S --noconfirm git git-lfs github-cli git-delta onefetch gitg gitui

  # Blockchain
  # pacman -S --noconfirm go-ethereum openethereum

  # Downloader
  pacman -S --noconfirm axel wget curl aria2 yt-dlp

  # Editor
  pacman -S --noconfirm neovim

  # File System
  pacman -S --noconfirm fuse3

  # Format
  pacman -S --noconfirm shfmt yamlfmt

  # Lint
  pacman -S --noconfirm shellcheck

  # AI
  pacman -S --noconfirm ollama

  # Kubernetes
  pacman -S --noconfirm kubernetes-tools helm minikube

  # trivy Find vulnerabilities, misconfigurations, secrets, SBOM in containers, Kubernetes, code repositories, clouds and more
  # gitleaks Find secrets with Gitleaks 🔑
  pacman -S --noconfirm trivy \
    gitleaks

  if [ -n "$(uname -r | grep -i wsl)" ]; then
    echo "Install WSL2 Tools"
  fi
}

_install
