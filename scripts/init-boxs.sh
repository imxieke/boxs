#!/usr/bin/env bash

if [ $(id -u) == 0 ]; then
  echo "User Only, no root"
fi

USER_HOME=${HOME}
