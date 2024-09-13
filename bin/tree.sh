#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-09-05 21:07:07
# @LastEditTime: 2024-09-13 21:02:51
# @LastEditors: Cloudflying
# @Description:
###

set -eu

usage=$(
  cat <<-'HELP'
usage: <find command options>
HELP
)

if type "tree" &>/dev/null; then
  tree -aC -I '.git|node_modules|bower_components' --dirsfirst "$@" | less # -FRNX;
else
  if [ "$1" = "-h" ] || [ "$1" = "--help" ]; then
    echo "$usage"
    exit 1
  fi

  [ -d "$1" ] && DIR=$1 && shift || DIR=.
  (
    cd ${DIR}
    pwd
  )
  find "${DIR}" "$@" \
    | sed -e "s,^${DIR},," \
      -e '/^$/d' \
      -e 's,[^/]*/\([^/]*\)$,\+--\1,' \
      -e 's,[^/]*/,   ,g' \
      -e 's,\(^\+--\)\|\(^   \),,'
fi
