#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2026-01-07 13:32:02
 # @LastEditTime: 2026-01-07 13:36:06
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
# trivy A Simple and Comprehensive Vulnerability Scanner for Containers
# trivy Find vulnerabilities, misconfigurations, secrets, SBOM in containers, Kubernetes, code repositories, clouds and more
pacman -S --noconfirm nmap rustscan osv-scanner sqlmap masscan trivy

# gitleaks Find secrets with Gitleaks 🔑
# Scanner
pacman -S --noconfirm trivy \
    gitleaks