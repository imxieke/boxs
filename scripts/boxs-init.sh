#!/usr/bin/env bash

# Think
# 检测系统环境 先安装程序所需依赖
# 检测系统环境 及本地代理是否运行
# 开始部署 boxs 环境

DATEFORMAT=$(date "+%Y%m%d-%H%M%S")

# only support debian-like archlinux alpine macOS(brew)
# macOS
if [[ "$(uname -s)" == 'Darwin' ]]; then
  OSNAME='Darwin'
elif [[ "$(uname -s)" == 'Linux' ]]; then
  OSNAME=$(grep '^ID=' /etc/os-release | grep '^ID=' | awk -F '=' '{print $2}')
fi

if [[ "${OSNAME}" != 'Darwin' ]]; then
  [ $(id -u) != 0 ] && echo "use root user to continue" exit 1
fi

# mkdir -p ~/.boxs/{backup,opt,logs}

# 存储自定义可执行文件
mkdir -p ~/.bin

_deps() {
  echo "==> Fix OS Depency"
  case "$OSNAME" in
    debian | ubuntu)
      apt update -y && apt install -y --no-install-recommends git procps wget curl ca-certificates
      ;;
    Darwin)
      brew install git wget curl ca-certificates
      ;;
    alpine)
      apk add --no-cache git procps wget curl ca-certificates
      ;;
    arch* | manjaro)
      pacman -S --noconfirm git procps wget curl ca-certificates
      ;;
    *)
      echo default
      ;;
  esac
}

# 初始化系统检测
_init_check() {
  if [[ -z "$(command -v curl)" ]] || [[ -z "$(command -v wget)" ]] || [[ -z "$(command -v git)" ]]; then
    _deps
  fi

  echo "==> base run env checking"
  [ -z "$(command -v git)" ] && echo "command not found: git" && exit 1

  if [[ -n "$(command -v supervisorctl)" ]]; then
    mkdir -p /usr/local/etc
    [ ! -d /usr/local/etc/supervisor.d ] && ln -s ~/.boxs/etc/supervisor.d /usr/local/etc/supervisor.d
  fi

  chmod -R +x ~/.bin
  chmod -R +x ~/.boxs/bin
  # ~/.boxs/bin/all/set-sys-proxy
  echo "Configration All done, deploy now"
}

# 从远程获取文件
function _fetch() {
  if [[ -n "${2}" ]]; then
    _WGET_OUTPUT="-O $2"
    _AXEL_OUTPUT="-o $2"
  fi

  if [[ -n "$(command -v axel)" ]]; then
    axel -k -v -a -n 4 $1 $_AXEL_OUTPUT
  elif [[ -n "$(command -v wget)" ]]; then
    wget -c --no-check-certificate $1 $_WGET_OUTPUT
  fi
}

# Conside
# moreutils parallel gnupg2 tor-browser
# gron Make JSON greppable
# tor Anonymizing overlay network for TCP
# pass password manage
# ripgrep ripgrep recursively searches directories for a regex pattern while respecting your gitignore pass
# brew install mas mosh fzf mtr nmap openssl shellcheck tor tmux tcptraceroute repgrep ccat
# brew install node@14 php@73 tree pstree whois jq screen htop gron
# compress
# brew install zstd unar unzip xz unrar

_init_pkgs() {
  case "${OSNAME}" in
    alpine)
      _init_alpine_pkgs
      ;;
    arch* | manjaro)
      _init_pacman_pkgs
      ;;
    Darwin)
      _init_brew_pkgs
      ;;
    debian | ubuntu)
      _init_apt_pkgs
      ;;
    *)
      echo "Unknown ${OSNAME}" && exit 1
      ;;
  esac
}

_config_sublime() {
  if [[ "$(uname -s)" == "Darwin" ]]; then
    if [[ -d "${HOME}/Library/Application\ Support/Sublime\ Text\ 3/" ]]; then
      _SUBL_DIR=${HOME}/Library/Application\ Support/Sublime\ Text\ 3/
    elif [[ -d ${HOME}/Library/Application\ Support/Sublime\ Text\ 4/ ]]; then
      _SUBL_DIR=${HOME}/Library/Application\ Support/Sublime\ Text\ 4/
    elif [[ -d ~/Library/Application\ Support/Sublime\ Text\ Dev/ ]]; then
      _SUBL_DIR=~/Library/Application\ Support/Sublime\ Text\ Dev/
    elif [[ -d ~/Library/Application\ Support/Sublime\ Text/ ]]; then
      _SUBL_DIR=~/Library/Application\ Support/Sublime\ Text/
    else
      echo "Can't find Sublime Text in your computer"
    fi
    if [[ -f ~/.boxs/conf/backup/sublimetext/License.sublime_license-mac-$(sle -v | awk -F ' ' '{print $4}' | cut -c 1-2) ]]; then
      cp ~/.boxs/conf/backup/sublimetext/License.sublime_license-mac-$(sle -v | awk -F ' ' '{print $4}' | cut -c 1-2) ${_SUBL_DIR}/Local/License.sublime_license
    fi
    cp -fr ~/.boxs/conf/backup/sublimetext/conf/ "${_SUBL_DIR}/Packages/User/"
  fi
}

# Docker
# 设置 Docker 环境 并修改 普通用户使用 Docker
# https://pkgs-docker.pkg.coding.net/mirrors/docker
# https://22bvsrc3.mirror.aliyuncs.com
_config_docker() {
  if [[ "$(uname -s)" == 'Darwin' ]]; then
    mkdir -p ~/.docker
    # 		cat < EOF
    # {
    # 	"builder": {
    # 		"gc": {
    # 			"defaultKeepStorage": "64GB",
    # 			"enabled": true
    # 		}
    # 	},
    # 	"experimental": true,
    # 	"features": {
    # 		"buildkit": true
    # 	},
    # 	"registry-mirrors": [
    # 		"https://22bvsrc3.mirror.aliyuncs.com"
    # 	]
    # }
    # EOF > ~/.docker/daemon.json
  elif [[ "$(uname -s)" == 'Linux' ]]; then
    cat <EOF
    {
      "registry-mirrors": [
      "https://22bvsrc3.mirror.aliyuncs.com"
      ]
    }
    EOF >/etc/docker/daemon.json
    sudo usermod -aG docker $(whoami)
    sudo systemctl restart docker
  fi
}

# 获取 command-not-found 命令字典
_fetch_command_not_found_dict() {
  echo '==> Fetch command-not-found dict'

  # macos 需要下载字典 brew 慢的雅痞
  # archlinux 本地查询速度很快无需创建数据库
  if [[ "$(uname -s)" == 'Darwin' ]]; then
    curl -sL https://github.com/Homebrew/homebrew-command-not-found/raw/master/executables.txt --output ~/.boxs/etc/command-not-found/dict.txt
  elif [[ "$(uname -s)" == 'Linux' ]]; then
    if [[ -f /etc/os-release ]]; then
      OSNAME=$(grep '^ID=' /etc/os-release | grep '^ID=' | awk -F '=' '{print $2}')
      case "$OSNAME" in
        alpine)
          apk list >~/.boxs/etc/command-not-found/dict.txt
          ;;
        ubuntu | debian | deepin | uos | linuxmint | ubuntukylin)
          apt list >~/.boxs/etc/command-not-found/dict.txt
          ;;
        arch | manjaro)
          pacman -Sl | awk -F ' ' '{print $2}' >~/.boxs/etc/command-not-found/dict.txt
          ;;
        *)
          echo "unsupport your os ${OSNAME}"
          ;;
      esac
    fi
  fi
}

_init() {
  # 初始化检查
  _init_check
  _init_pkgs
  # _init_pmt_pkgs
  _config
  _fetch_command_not_found_dict

  _config_sublime
  _init_vscode
}

_init

# Fonts
# font dir
# ~/.fonts
# /usr/share/fonts
# /usr/local/share/fonts
# ~/.local/share/fonts
