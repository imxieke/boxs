#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:25:19
# @LastEditTime: 2024-09-27 14:35:32
# @LastEditors: Cloudflying
# @Description:
###

_pipadd()
{
  pip install --break-system-packages "$@"
}

_install_python_pkgs()
{
  _pipadd psutil pip-search

  # Static Type Checker
  _pipadd pyright

  _pipadd protobuf msgpack requests
  _pipadd neovim python-lsp-server pygls pynvim
  _pipadd nginx-language-server
  # deps
  # pyls
  _pipadd jedi
  _pipadd "python-lsp-server[all]"

  # Lint
  _pipadd sqlfluff yamllint
  _pipadd "pylint[spelling]"

  # Quick and reliable way to convert NGINX configurations into JSON and back.
  _pipadd crossplane
  _pipadd nginxfmt
  _pipadd pyndiff ujson tldr pyparsing pylint zope setuptools beautifulsoup4 gevent lxml podman-compose psutil msgpack protobuf packaging dill parso rope

  # Audits Python environments and dependency trees for known vulnerabilities
  _pipadd pip-audit
  # HTTPie is making APIs simple and intuitive for those building the tools of our time.
  _pipadd httpie

  _pipadd you-dl youtube-dl yt-dlp
}

_install_python_pkgs
