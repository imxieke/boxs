#!/usr/bin/env bash
###
# @Author: Cloudflying
# @Date: 2024-12-31 08:56:41
 # @LastEditTime: 2025-03-14 23:57:30
 # @LastEditors: Cloudflying
# @Description: Rust Config
###

cargo install cargo-update

rustup target add aarch64-apple-ios
rustup target add aarch64-apple-ios-macabi

rustup target add aarch64-linux-android

rustup target add x86_64-unknown-freebsd

rustup target add aarch64-apple-darwin
rustup target add x86_64-apple-darwin

rustup target add i686-pc-windows-gnu
rustup target add i686-pc-windows-msvc

rustup target add x86_64-pc-windows-gnu
rustup target add x86_64-pc-windows-msvc

rustup target add i686-unknown-linux-gnu

rustup target add x86_64-unknown-linux-gnu
rustup target add x86_64-unknown-linux-musl

rustup target add aarch64-unknown-linux-gnu
rustup target add aarch64-unknown-linux-musl

rustup target add loongarch64-unknown-linux-gnu
rustup target add loongarch64-unknown-linux-musl
