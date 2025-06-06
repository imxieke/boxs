#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2023-03-27 20:23:30
 # @LastEditTime: 2025-04-20 16:40:34
 # @LastEditors: Cloudflying
# @Description:
###

_install()
{
  mkdir -p ~/.go/bin     # 包含可执行文件，如：编译器，Go 工具
  mkdir -p ~/.go/src     # 包含源代码构建脚本和标准库的包的完整源代码
  mkdir -p ~/.go/doc     # 包含示例程序，代码工具，本地文档等
  mkdir -p ~/.go/lib     # 包含文档模版
  mkdir -p ~/.go/misc    # 包含与支持 Go 编辑器有关的配置文件以及 cgo 的示例
  mkdir -p ~/.go/os_arch # 包含标准库的包的对象文件（.a）
  mkdir -p ~/.go/cmd     # 包含 Go 和 C 的编译器和命令行脚本
  export GOPATH="${HOME}/.go"
  export GOBIN="${GOPATH}/bin"
  export GOSRC="${GOPATH}/src"
  export PATH="$PATH:$GOBIN"
  export GOPROXY=https://goproxy.cn,direct
  # Pure Go implementation of jq
  go install github.com/itchyny/gojq/cmd/gojq@latest
  go install github.com/davecheney/httpstat@latest
  go install github.com/MichaelMure/mdr@latest
  # Yet another Go implementation of jo
  go install github.com/itchyny/gojo/cmd/gojo@latest
  go install github.com/liamg/extrude/cmd/extrude@latest
  go install github.com/liamg/scout/cmd/scout@latest
  go install github.com/liamg/gifwrap/cmd/gifwrap@latest
  go install github.com/aquasecurity/tfsec/cmd/tfsec@latest
  go install github.com/aquasecurity/tfsec/cmd/tfsec-docs@latest
  go install github.com/aquasecurity/tfsec/cmd/tfsec-checkgen@latest
  go install github.com/acarl005/ls-go@latest
  go install github.com/jaytaylor/html2text/cmd/html2text@latest

  # SSH 快速选择 无需输入 主机名 用户名 密码 等信息
  go install github.com/lixvbnet/sshw@latest

  # editorconfig linter
  go install github.com/editorconfig-checker/editorconfig-checker/cmd/editorconfig-checker@latest
  go install github.com/golangci/golangci-lint/cmd/golangci-lint@latest
  go install github.com/rhysd/actionlint/cmd/actionlint@latest
  # Go Linter
  go install golang.org/x/tools/cmd/goimports@latest
  go install honnef.co/go/tools/cmd/staticcheck@latest

  # simple terminal UI for git commands
  go install github.com/jesseduffield/lazygit@latest

  # Mackerel graph viewer in terminal
  go install github.com/itchyny/mkrg/cmd/mkrg@latest

  # A Docker manager for the terminal
  go install github.com/moncho/dry@latest
  # Base58 encoding/decoding package and command written in Go
  go install github.com/itchyny/base58-go/cmd/base58@latest
  # Binary editor written in Go
  go install github.com/itchyny/bed/cmd/bed@latest

  go install github.com/olivere/iterm2-imagetools/cmd/imgcat@latest
  go install github.com/olivere/iterm2-imagetools/cmd/imgls@latest

  # NetWork
  # 🐶 Command-line DNS Client for Humans. Written in Golang
  # deprecated has move to offcial repo
  # go install github.com/mr-karan/doggo/cmd/doggo@latest
  # A tiny command line DNS client with support for UDP, TCP, DoT, DoH, DoQ and ODoH.
  go install github.com/natesales/q@latest
  go install github.com/itchyny/maze/cmd/maze@latest
  if [[ "$(uname -s)" == 'Linux' ]]; then
    go install github.com/liamg/traitor/cmd/traitor@latest
  fi
}

_install
