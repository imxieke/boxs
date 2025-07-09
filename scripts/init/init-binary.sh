#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-09-17 20:01:41
 # @LastEditTime: 2025-03-26 17:57:17
 # @LastEditors: Cloudflying
# @Description: 可执行文件初始化 如 二进制文件 Shell Python 脚本
###

ROOT_PATH=~/.local/share/boxs

mkdir -p "${ROOT_PATH}/bin"
mkdir -p "${ROOT_PATH}/java"
mkdir -p "${ROOT_PATH}/shell"

BIN_PATH="${HOME}/bin"
JAVA_PATH="${ROOT_PATH}/java"
SHELL_PATH="${ROOT_PATH}/shell"
# GITHUB_MIRROR='https://ghproxy.com/'
GITHUB_MIRROR='https://gh-proxy.com/'

# macOS 可执行脚本
_install_scripts()
{
  echo "==> Fetch neofetch"
  curl -sL https://github.com/dylanaraps/neofetch/raw/master/neofetch --output "${BIN_PATH}/neofetch"

  echo "==> Fetch screenfetch"
  curl -sL https://github.com/KittyKatt/screenFetch/raw/master/screenfetch-dev --output "${BIN_PATH}/screenfetch"

  echo "==> Fetch speedtest-cli"
  curl -sL https://github.com/sivel/speedtest-cli/raw/master/speedtest.py --output "${BIN_PATH}/speedtest-cli"

  echo "==> Fetch bashtop"
  curl -sL https://github.com/aristocratos/bashtop/raw/master/bashtop --output "${BIN_PATH}/bashtop"

  echo "==> Fetch Python Httpstat"
  curl -sL https://raw.githubusercontent.com/reorx/httpstat/master/httpstat.py --output "${BIN_PATH}/httpstat.py"

  echo "==> Fetch Bash Httpstat"
  curl -fsSL https://github.com/b4b4r07/httpstat/raw/master/httpstat.sh --output "${BIN_PATH}/httpstat.sh"

  echo "==> Fetch PHP Composer"
  curl -fsSL "https://mirrors.cloud.tencent.com/composer/composer.phar" --output "${BIN_PATH}/composer"
}

# linux 二进制文件
_install_linux()
{
  echo "==> Fetch Next Trace"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/sjlleo/nexttrace/releases/latest/download/nexttrace_linux_amd64" --output ${BIN_PATH}/nexttrace

  echo "==> Fetch nexttrace experiment"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/OwO-Network/nexttrace-experiment/releases/latest/download/nexttrace_linux_amd64" --output ${BIN_PATH}/nexttrace-plus

  # Use AirPlay Stream to UPnP/Sonos & Chromecast devices
  echo "==> Fetch AirCast"
  curl -sL https://github.com/philippe44/AirConnect/raw/master/bin/aircast-linux-x86_64 --output ${BIN_PATH}/aircast

  echo "==> Fetch AirUpnp"
  curl -sL https://github.com/philippe44/AirConnect/raw/master/bin/airupnp-linux-x86_64 --output ${BIN_PATH}/airupnp

  echo "==> Fetch ookla speedtest.net Cli Speed Test for Linux"
  curl -sL https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-linux-x86_64.tgz | tar -C ${BIN_PATH}/ -xvf - speedtest

  echo "==> Fetch Microsoft Dev Tunnel"
  CURL -sL https://tunnelsassetsprod.blob.core.windows.net/cli/linux-x64-devtunnel --output ${BIN_PATH}/devtunnel

  echo "==> Fetch Hadolint Dockerfile Lint"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Linux-x86_64" --output ${BIN_PATH}/hadolint

  echo "==> Fetch Qodana"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/JetBrains/qodana-cli/releases/latest/download/qodana_linux_x86_64" --output ${BIN_PATH}/qodana

  chmod +x ${HOME}/.bin/*
}

# macOS 二进制文件
_install_macos()
{
  # static php cli (spc)
  echo "==> Fetch Next Trace"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/sjlleo/nexttrace/releases/latest/download/nexttrace_darwin_amd64" --output ${BIN_PATH}/nexttrace

  echo "==> Fetch nexttrace experiment"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/OwO-Network/nexttrace-experiment/releases/latest/download/nexttrace_darwin_amd64" --output ${BIN_PATH}/nexttrace-plus

  echo "==> Fetch Hadolint Dockerfile Lint"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/hadolint/hadolint/releases/latest/download/hadolint-Darwin-x86_64" --output ${BIN_PATH}/hadolint

  # Use AirPlay Stream to UPnP/Sonos & Chromecast devices
  echo "==> Fetch AirCast"
  curl -sL https://github.com/philippe44/AirConnect/raw/master/bin/aircast-macos-x86_64 --output ${BIN_PATH}/aircast

  echo "==> Fetch AirUpnp"
  curl -sL https://github.com/philippe44/AirConnect/raw/master/bin/airupnp-macos-x86_64 --output ${BIN_PATH}/airupnp

  echo "==> Fetch ookla speedtest.net Cli Speed Test for macOS"
  curl -sL https://install.speedtest.net/app/cli/ookla-speedtest-1.2.0-macosx-universal.tgz | tar -C ${BIN_PATH}/ -xvf - speedtest
}

# java 二进制文件 配合 alias 或自定义脚本使用
_install_jar()
{
  echo "==> Fetch dex2jar"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/pxb1988/dex2jar/releases/download/v2.1/dex2jar-2.1.zip" --output /tmp/dex2jar-2.1.zip
  unzip -qo /tmp/dex2jar-2.1.zip -d ${JAVA_PATH}
  rm -fr /tmp/dex2jar-2.1.zip
  mv ${JAVA_PATH}/dex-tools-2.1 ${JAVA_PATH}/dex-tools

  echo "==> Fetch Java Decompiler gui"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/java-decompiler/jd-gui/releases/download/v1.6.6/jd-gui-1.6.6.jar" --output ${JAVA_PATH}/jd-gui.jar

  echo "==> Fetch procyon Decompiler"
  curl -fsSL "${GITHUB_MIRROR}https://github.com/mstrobel/procyon/releases/download/v0.6.0/procyon-decompiler-0.6.0.jar" --output ${JAVA_PATH}/procyon-decompiler.jar
}

# 无法直接执行的脚本
_install_lib()
{
  echo "==> Fetch nvm.sh"
  curl -fsSL "${GITHUB_MIRROR}https://raw.githubusercontent.com/nvm-sh/nvm/master/nvm.sh" --output ${SHELL_PATH}/nvm.sh
}

install_spc()
{
  VERSIONS=(
    "8.4.6"
    "8.3.20"
    "8.2.28"
    "8.1.32"
    "8.0.30"
  )
  for version in "${VERSIONS[@]}"; do
    if [[ "$(uname -s)" == "Darwin" ]]; then
      wget -c "https://dl.static-php.dev/static-php-cli/bulk/php-${version}-cli-macos-x86_64.tar.gz" -O "/tmp/php-${version}.tar.gz"
    elif [[ "$(uname -s)" == "Linux" ]]; then
      wget -c "https://dl.static-php.dev/static-php-cli/bulk/php-${version}-cli-linux-x86_64.tar.gz" -O "/tmp/php-${version}.tar.gz"
    fi
  done
  mkdir -p ${HOME}/.bin
  for version in "${VERSIONS[@]}"; do
    mkdir -p /tmp/php-bin
    tar -xvf "/tmp/php-${version}.tar.gz" -C /tmp/php-bin >/dev/null
    version=${version//./}
    mv /tmp/php-bin/php ~/.bin/php"${version:0:2}"
  done
}

case "$1" in
  scripts | -s)
    _install_scripts
    ;;
  jar)
    _install_jar
    ;;
  spc)
    install_spc
    ;;
  lib | -l)
    _install_lib
    ;;
  *)
    echo "Usage:
<cmd> os                os Package
<cmd> scripts|-s        Shell Scripts Or Python ,PHP And More
<cmd> jar|-j            Jar File
<cmd> lib|-l            Library
"
    ;;
esac
