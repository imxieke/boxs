#!/usr/bin/env bash
# Boxs Recovery

ROOT_PATH="$(dirname $(dirname $0))"

source "${ROOT_PATH}/conf/config/os/env.sh"

if [[ "$(uname -s)" == 'Darwin' ]]; then
  if [[ ! -f "${HOME}/.composer/config.json}" ]]; then
    mkdir -p "${HOME}/.composer"
    ln -sf "${BOXS_HOME}/conf.d/composer/config.json" "${HOME}/.composer/config.json"
  fi
fi
