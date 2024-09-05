#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-05-31 23:18:43
# @LastEditTime: 2024-05-31 23:18:48
# @LastEditors: Cloudflying
# @Description: Golang
###

if [[ -n $(command -v go) ]]; then
  mkdir -p ~/.go/bin     # 包含可执行文件，如：编译器，Go 工具
  mkdir -p ~/.go/src     # 包含源代码构建脚本和标准库的包的完整源代码（Go 是一门开源语言）
  mkdir -p ~/.go/doc     # 包含示例程序，代码工具，本地文档等
  mkdir -p ~/.go/lib     # 包含文档模版
  mkdir -p ~/.go/misc    # 包含与支持 Go 编辑器有关的配置文件以及 cgo 的示例
  mkdir -p ~/.go/os_arch # 包含标准库的包的对象文件（.a）
  mkdir -p ~/.go/cmd     # 包含 Go 和 C 的编译器和命令行脚本
  export GOPATH="${HOME}/.go"
  export GOBIN="${GOPATH}/bin"
  export GOSRC="${GOPATH}/src"
  export PATH="$PATH:$GOBIN"

  # 启用 Go Modules 功能
  export GO111MODULE=on
  # 官网
  # sum.golang.org
  export GOSUMDB=sum.golang.google.cn
  # index.golang.org

  # 配置 GOPROXY 环境变量
  # https://mirrors.cloud.tencent.com/go/
  # https://mirrors.aliyun.com/goproxy/
  # 似乎是官方的 国内也挺快
  # proxy.golang.org
  # https://goproxy.io
  # Qiniu
  # https://goproxy.cn
  # Baidu
  # https://goproxy.bj.bcebos.com
  export GOPROXY=https://goproxy.io,direct
  # 设置不走 proxy 的私有仓库或组，多个用逗号相隔
  # export GOPRIVATE=*.corp.example.com,git.mycompany.com,github.com/my/private
  # export GOSUMDB=gosum.io+ce6e7565+AY5qEHUk/qmHc5btzW45JVoENfazw8LielDsaI+lEbq6
fi
