#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2026-03-04 00:18:13
# @LastEditTime: 2026-03-04 00:34:16
# @LastEditors: Cloudflying
# @Description: Navicat Sync
###

ROOT_PATH=$(dirname $(dirname $(dirname $(realpath $0))))
NAVICAT_PATH=${ROOT_PATH}/home/.config/navicat

echo "Navicat Sync"

if [[ "$(uname -s)" == 'Darwin' ]]; then
  # DIR="~/Library/Containers/com.navicat.NavicatPremium/Data/Library/Application\ Support/PremiumSoft\ CyberTech/Navicat\ CC"
  DIR="${HOME}/Library/Containers/com.navicat.NavicatPremium/Data/Library/Application Support/PremiumSoft CyberTech/Navicat CC"
  mkdir -p "${CONFIG_PATH}/navicat/Profiles"
  cd "${DIR}"
  sync "Navicat Premium/Profiles/vgroup.json" "${CONFIG_PATH}/navicat"
  sync "Common/" "${CONFIG_PATH}/navicat/"
elif [[ "$(uname -s)" == "Linux" ]]; then
  echo ""
fi

if [[ -n "$(uname -r | grep -i "wsl")" ]]; then
  if [[ -d "/mnt/e/Sync/OneDrive/Documents/Navicat" ]]; then
    NAVICAT="/mnt/e/Sync/OneDrive/Documents/Navicat"
    if [[ -d "${NAVICAT}/Premium/profiles" ]]; then
      cp -fr "${NAVICAT}"/Premium/profiles/*.db "${NAVICAT_PATH}/Premium/profiles/"
      cp -fr "${NAVICAT}"/Premium/profiles/*.nbatpremium "${NAVICAT_PATH}/Premium/profiles/"
      cp -fr "${NAVICAT}"/Premium/profiles/*.json "${NAVICAT_PATH}/Premium/profiles/"
    fi

    if [[ -d "${NAVICAT}/MySQL/profiles" ]]; then
      cp -fr "${NAVICAT}"/MySQL/profiles/*.ndsymysql "${NAVICAT_PATH}/MySQL/profiles/"
      cp -fr "${NAVICAT}"/MySQL/profiles/*.nssymysql "${NAVICAT_PATH}/MySQL/profiles/"
    fi
  fi
fi
