#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2026-03-04 00:30:26
# @LastEditTime: 2026-03-04 00:32:34
# @LastEditors: Cloudflying
# @Description: GNUPG Sync
###

echo "GnuPG Sync"
GPG_HOME="${HOME_PATH}/.gnupg"
mkdir -p "${GPG_HOME}"
if [[ -d "${HOME}/.gnupg" ]]; then
  cp -fr "${HOME}/.gnupg/common.conf" "${GPG_HOME}/"
  cp -fr "${HOME}/.gnupg/sshcontrol" "${GPG_HOME}/"
  cp -fr "${HOME}/.gnupg/trustdb.gpg" "${GPG_HOME}/"
  cp -fr "${HOME}/.gnupg/openpgp-revocs.d" "${GPG_HOME}/"
  cp -fr "${HOME}/.gnupg/private-keys-v1.d" "${GPG_HOME}/"
  cp -fr "${HOME}/.gnupg/public-keys.d" "${GPG_HOME}/"
fi
