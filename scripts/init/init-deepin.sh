#!/usr/bin/env bash

_install()
{
  apt install -y "$@"
}

_install openssh-server
_install uos-remote-assistance