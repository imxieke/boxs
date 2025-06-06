#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2025-03-27 10:46:27
 # @LastEditTime: 2025-03-27 10:52:38
 # @LastEditors: Cloudflying
 # @Description: PHP Version Manager
###

VERSION=$1

if [ -z "${VERSION}" ]; then
  VERSION="${PHP_VERSION:-82}"
fi

if [[ -f "${HOME}/.bin/php${VERSION}" ]]; then
  ln -sf "${HOME}/.bin/php${VERSION}" "${HOME}/.bin/php"
else
  echo "Special PHP Version Not Found: ${VERSION}"
  echo "usage: php-vm.sh 82 83 84 ..."
fi
