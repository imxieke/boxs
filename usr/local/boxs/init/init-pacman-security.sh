#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-01-07 13:32:02
 # @LastEditTime: 2026-01-12 14:44:37
 # @LastEditors: Cloudflying
 # @Description: Arch Linux Security Software Init Script
###

# ghidra Software reverse engineering framework
# metasploit Advanced open-source platform for developing, testing, and using exploit code
pacman -S --noconfirm ghidra metasploit


# Rustscan Port Scanner
pacman -S --noconfirm metasploit ghidra jadx rustscan

# Security
# osv-scanner Vulnerability scanner
# trivy A Simple and Comprehensive Vulnerability Scanner for Containers, Suitable for CI
pacman -S --noconfirm nmap rustscan osv-scanner sqlmap masscan trivy

# gitleaks Find secrets with Gitleaks 🔑
# clair Vulnerability Static Analysis for Containers.
# Scanner
pacman -S --noconfirm clair \
    gitleaks