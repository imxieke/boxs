#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2022-08-22 23:46:22
# @LastEditTime: 2024-09-18 17:56:20
# @LastEditors: Cloudflying
# @Description: Phar Manager {install update remove}
###

BIN_PATH=${HOME}/.bin
mkdir -p "${BIN_PATH}"

# TODO
# - build phar
# - phactor

# GIT_HOST="https://ghproxy.com"
GIT_HOST="https://github.com"
# GIT_HOST="https://gitclone.com" # error
# GIT_HOST="https://gh-proxy.com"

# username/repo
get_github_latest_version()
{
  repo=$1
  url="${GIT_HOST}/${repo}/releases/latest"
  version=$(curl -sI "${url}" | grep -Ei "${GIT_HOST}/\S+releases/tag/" | awk -F 'releases/tag/' '{print $2}')
  if [[ -n "${version}" ]]; then
    echo "${version}"
  fi
}

# 从远程获取文件
# _fetch url save
function _fetch()
{
  DOWNLOADER='wget'
  if [[ -n "${2}" ]]; then
    _WGET_OUTPUT="-O $2"
    _AXEL_OUTPUT="-o $2"
  fi

  if [[ ${DOWNLOADER} == "axel" ]]; then
    axel -k -v -a -n 4 $1 $_AXEL_OUTPUT
  elif [[ ${DOWNLOADER} == "wget" ]]; then
    wget -c --no-check-certificate $1 $_WGET_OUTPUT
  fi
}

add_bin()
{
  mkdir -p ${HOME}/.bin
  cd "${HOME}/.bin" || exit 1
  if [[ ! -f "$2" ]]; then
    _fetch $1 $2
    chmod +x $2
  else
    echo $2 "has been downloaded"
  fi
}

fetch_latest_version_phar()
{
  repo=$1
  filename=$2
  save=$3

  if [[ -f "${HOME}/.bin/$save" ]]; then
    echo "${save}" "has been downloaded"
  else
    ver=$(get_github_latest_version $1 | tr -d '\n\r')
    ver=$(echo -e "${ver}" | sed "s# ##g")
    [ -z "${repo}" ] && echo "repo param null" && exit 1
    [ -z "${filename}" ] && echo "filename param null" && exit 1
    [ -z "${save}" ] && echo "save param null" && exit 1
    [ -z "${ver}" ] && echo "ver is null, can't fetch latest version" && exit 1
    fullUrl="${GIT_HOST}/${repo}/releases/download/${ver}/${filename}"
    echo "Fetch ${save} ${ver}"
    add_bin "${fullUrl}" "${save}"
  fi
}

# A tool for quickly measuring the size of a PHP project.
add_bin https://pods.xie.ke/pkgs/phar/phpactor.phar ${BIN_PATH}/phpactor
add_bin https://pods.xie.ke/pkgs/phar/phploc.phar ${BIN_PATH}/phploc
add_bin https://pods.xie.ke/pkgs/phar/phpcpd.phar ${BIN_PATH}/phpcpd
add_bin https://pods.xie.ke/pkgs/phar/phpmd.phar ${BIN_PATH}/phpmd
add_bin https://pods.xie.ke/pkgs/phar/phive.phar ${BIN_PATH}/phive
add_bin https://pods.xie.ke/pkgs/phar/phpunit.phar ${BIN_PATH}/phpunit
add_bin https://pods.xie.ke/pkgs/phar/phpbu.phar ${BIN_PATH}/phpbu
# 运行 PHPUnit 单元测试（包括测试结果和覆盖率报告）、文件转换（例如令牌替换、XSLT 转换、模板转换）
# 文件系统操作、交互式构建支持、SQL 执行、SCM 操作（Git、Subversion 和 Mercurial）、文档生成（PhpDocumentor、ApiGen）等等
add_bin https://pods.xie.ke/pkgs/phar/phing.phar ${BIN_PATH}/phing
add_bin https://pods.xie.ke/pkgs/phar/phpDocumentor.phar ${BIN_PATH}/phpDocumentor

add_bin https://pods.xie.ke/pkgs/phar/doctum.phar ${BIN_PATH}/doctum
add_bin https://pods.xie.ke/pkgs/phar/security-checker.phar ${BIN_PATH}/security-checker

# last update on May 9, 2021
# Detect flaws in your architecture, before they drag you down into the depths of dependency hell ...
# add_bin mihaeu/dephpend dephpend-0.8.0.phar ${BIN_PATH}/dephpend

# Commits on Apr 20, 2023 incompatible with PHP 8.2
# Documentation generator for PHP Code using standard technology (SRC, DOCBLOCK, XML and XSLT)
add_bin https://pods.xie.ke/pkgs/phar/phpdox.phar ${BIN_PATH}/phpdox

# A lightweight php namespace aware autoload generator and phar archive builder
add_bin https://pods.xie.ke/pkgs/phar/phpab.phar ${BIN_PATH}/phpab

# A CLI tool to check whether a specific composer package uses imported symbols that aren't part of its direct composer dependencies
add_bin https://pods.xie.ke/pkgs/phar/composer-require-checker.phar ${BIN_PATH}/composer-require-checker

# Commits on Sep 15, 2023
# Beautiful and understandable static analysis tool for PHP
add_bin https://pods.xie.ke/pkgs/phar/phpmetrics.phar ${BIN_PATH}/phpmetrics

# PHP_Depend is an adaptation of the established Java development tool JDepend. This tool shows you the quality of your design in terms of extensibility, reusability and maintainability.
add_bin https://pods.xie.ke/pkgs/phar/pdepend.phar ${BIN_PATH}/pdepend

# 🐛 A tool that can speed up linting of php files by running several lint processes at once.
add_bin https://pods.xie.ke/pkgs/phar/phplint.phar ${BIN_PATH}/phplint

# This tool check syntax of PHP files faster than serial check with fancier output.
add_bin https://pods.xie.ke/pkgs/phar/parallel-lint.phar ${BIN_PATH}/parallel-lint

add_bin https://pods.xie.ke/pkgs/phar/php-cs-fixer.phar ${BIN_PATH}/php-cs-fixer

# PHP Benchmarking framework
add_bin https://pods.xie.ke/pkgs/phar/phpbench.phar ${BIN_PATH}/phpbench
# # PHP Static Analysis Tool - discover bugs in your code without running it!
add_bin https://pods.xie.ke/pkgs/phar/phpstan.phar ${BIN_PATH}/phpstan
add_bin https://pods.xie.ke/pkgs/phar/deployer.phar ${BIN_PATH}/deployer
add_bin https://pods.xie.ke/pkgs/phar/grumphp.phar ${BIN_PATH}/grumphp

# https://github.com/PHPCSStandards/PHP_CodeSniffer
# PHP_CodeSniffer tokenizes PHP files and detects violations of a defined set of coding standards.
add_bin https://pods.xie.ke/pkgs/phar/phpcbf.phar ${BIN_PATH}/phpcbf
add_bin https://pods.xie.ke/pkgs/phar/phpcs.phar ${BIN_PATH}/phpcs

# PHP Mutation Testing library
add_bin https://pods.xie.ke/pkgs/phar/infection.phar ${BIN_PATH}/infection

chmod +x ${BIN_PATH}/*
