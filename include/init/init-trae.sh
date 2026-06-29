#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2025-03-07 10:04:27
 # @LastEditTime: 2025-05-10 07:51:10
 # @LastEditors: Cloudflying
 # @Description: Init Trae
###

EXTE_LISTS=(
  adguard.adblock
  ahmadalli.vscode-nginx-conf
  alibaba-cloud.tongyi-lingma
  amazonwebservices.amazon-q-vscode
  aminer.codegeex
  anhuizhuojiantechnology.iflycode
  baiducomate.comate
  bmewburn.vscode-intelephense-client
  bpruitt-goddard.mermaid-markdown-syntax-highlighting
  caponetto.vscode-diff-viewer
  chrisbibby.hide-git-ignored
  codeium.codeium
  codium.codium
  dart-code.dart-code
  dbaeumer.vscode-eslint
  dbcode.dbcode
  devsense.phptools-vscode
  devsense.profiler-php-vscode
  eamodio.gitlens
  esbenp.prettier-vscode
  fittentech.fitten-code
  foxundermoon.shell-format
  gera2ld.markmap-vscode
  getpsalm.psalm-vscode-plugin
  github.vscode-github-actions
  golang.go
  gruntfuggly.todo-tree
  imxieke.cloudflying-snippets
  juanblanco.solidity
  mads-hartmann.bash-ide-vscode
  mhutchie.git-graph
  mikestead.dotenv
  ms-python.debugpy
  ms-python.python
  ms-vscode-remote.remote-containers
  ms-vscode-remote.remote-ssh
  ms-vscode-remote.remote-ssh-edit
  ms-vscode.remote-explorer
  ms-vscode.remote-server
  obkoro1.korofileheader
  rangav.vscode-thunder-client
  redhat.vscode-yaml
  shd101wyy.markdown-preview-enhanced
  sourcegraph.cody-ai
  svipas.prettier-plus
  tabnine.tabnine-vscode
  tamasfe.even-better-toml
  timonwong.shellcheck
  visualstudioexptteam.vscodeintellicode
  xdebug.php-debug
  yzhang.markdown-all-in-one
)

for ext in "${EXTE_LISTS[@]}"; do
  trae --install-extension ${ext}
done
