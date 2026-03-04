#!/usr/bin/env bash
###
 # @Author: Cloudflying
 # @Date: 2022-07-29 18:50:11
 # @LastEditTime: 2024-05-08 20:37:38
 # @LastEditors: Cloudflying
 # @Description: install archlinux script
###

if [[ -z "$(grep 'edu\.cn' /etc/pacman.d/mirrorlist)" ]]; then
	reflector --country China --protocol https --latest 5 --sort rate --save /etc/pacman.d/mirrorlist
fi

pacman -Syy

# ls -lha /usr/share/kbd/keymaps/**/*.map.gz
# timedatectl set-ntp true
# timedatectl status
pacman -S --noconfirm pacman-contrib

# cfdisk /dev/sda
# mkswap /dev/sda1
# mkfs.fat /dev/sda2
# mkfs.btrfs -L Lable /dev/sda3
# mount -t btrfs -o compress=zstd /dev/sda3 /mnt
# btrfs subvolume create /mnt/@ # 创建 / 目录子卷
# btrfs subvolume create /mnt/@home # 创建 /home 目录子卷
# btrfs subvolume list -p /mnt
# umount /mnt

# mount -t btrfs -o subvol=/@,compress=zstd /dev/sda3 /mnt # 挂载 / 目录
# mkdir /mnt/home # 创建 /home 目录
# mount -t btrfs -o subvol=/@home,compress=zstd /dev/sda3 /mnt/home # 挂载 /home 目录
# mkdir -p /mnt/boot/efi # 创建 /boot/efi 目录
# mount /dev/sda1 /mnt/boot/efi # 挂载 /boot/efi 目录
# swapon /dev/sda2 # 挂载交换分区

EFI_DEV='/dev/sda1'
SWAP_DEV='/dev/sda2'
ROOT_DEV='/dev/sda3'

if [[ -z "$(df -h | grep '/efi')" ]]; then
	mkdir -p /mnt/boot/efi
	# mount /dev/nvme0n1p1 /mnt/boot/efi
	mount /dev/sda1 /mnt/boot
fi

if [[ -z "$(genfstab -U /mnt | grep 'swap')" ]]; then
	# swapon /dev/nvme0n1p2
	swapon /dev/sda2
fi

if [[ -z "$(df -h | grep '/mnt')" ]]; then
	# mount -t ext4 /dev/nvme0n1p3 /mnt
	mount -t ext4 /dev/sda3 /mnt
fi

# 目录不存在或目录为空则不是 uefi
# ls -lha /sys/firmware/efi/efivars

# 检测是否已经安装 防止覆盖
if [[ ! -f "/mnt/bin/bash" ]]; then
	pacman -Sy --noconfirm archlinux-keyring
	pacstrap /mnt base base-devel linux linux-firmware
	pacstrap /mnt dhcpcd iwd sudo zsh neovim git file tree jq neofetch screenfetch curl wget axel reflector
fi

# Install Desktop Envirment
pacstrap /mnt plasma kde-graphics kde-multimedia kde-network kde-pim kde-system kde-utilities kde-games kde-applications
pacstrap /mnt sddm sddm-kcm

pacstrap /mnt ark bzip2 unzip unarchiver gzip tar p7zip unrar lzip xz zip zstd

# pacstrap /mnt packagekit packagekit-qt5

# Tools
# flameshot screenshot
# shutter screenshot
# jp2a A small utility for converting JPG images to ASCII
pacstrap /mnt tree jq git fzf sudo file less zsh cowsay cowfortune htop lsb-release ntp \
		psmisc gitui lolcat flameshot shutter jp2a

# Kde Applications
# not found pikasso alligator pix kclock kalk kweather
# pacstrap /mnt labplot krita kdenlive kdevelop ksysguard kile okteta krusader calligra index-fm apper calligra-plan kbibtex

# Input Method
pacstrap /mnt fcitx fcitx-configtool fcitx-googlepinyin

pacstrap /mnt grub efibootmgr os-prober

# Office
# libreoffice-fresh beta version
# pacstrap /mnt libreoffice-fresh libreoffice-fresh-zh-cn libreoffice-extension-texmaths libreoffice-extension-writer2latex

# Deepin
# not found: deepin-mail deepin-diskmanager
# pacstrap /mnt deepin-screen-recorder deepin-music deepin-system-monitor deepin-album \
	# deepin-calculator deepin-editor deepin-draw deepin-font-manager deepin-image-viewer \
	#  deepin-movie deepin-picker deepin-reader

# GImp
# pacstrap /mnt gimp gimp-help-zh_cn gimp-plugin-gmic

# Wine
# pacstrap /mnt wine vkd3d wine-gecko winetricks

# Downloader
pacstrap /mnt axel wget curl aria2

# Editor
pacstrap /mnt neovim code

# Fonts
# pacstrap /mnt adobe-source-han-serif-cn-fonts wqy-microhei wqy-zenhei

# Browser
# tor-browser edge google-chrome
pacstrap /mnt \
		vivaldi vivaldi-ffmpeg-codecs
# 		firefox firefox-i18n-zh-cn \
# 		firefox-developer-edition firefox-developer-edition-i18n-zh-cn \
# 		chromium \
# 		falkon

genfstab -U /mnt > /mnt/etc/fstab


echo "ArchBoxs" > /mnt/etc/hostname

echo "
127.0.0.1   localhost
::1         localhost
127.0.1.1   archboxs.localdomain	archboxs" > /mnt/etc/hosts
echo 'LANG=en_US.UTF-8'  > /mnt/etc/locale.conf
arch-chroot /mnt

PASSWORD=
RUNUSER=imxieke

ln -sf /usr/share/zoneinfo/Asia/Shanghai /etc/localtime
hwclock --systohc
sed -i "s'#en_US.UTF-8 UTF-8'en_US.UTF-8 UTF-8'g" /etc/locale.gen
sed -i "s'#zh_CN.UTF-8 UTF-8'zh_CN.UTF-8 UTF-8'g" /etc/locale.gen
locale-gen

useradd -m -G wheel -s /usr/bin/zsh ${RUNUSER}
echo "root:${PASSWORD}" | chpasswd
echo "${RUNUSER}:${PASSWORD}" | chpasswd
# 设置用户组可以使用 root 权限
sed -i 's/# %wheel ALL=(ALL:ALL) ALL/%wheel ALL=(ALL:ALL) ALL/g' /etc/sudoers

if [[ -n "$(grep 'model name' /proc/cpuinfo | grep -i 'intel')" ]]; then
	pacman -S --noconfirm intel-ucode mesa lib32-mesa vulkan-intel lib32-vulkan-intel
elif [[ -n "$(grep 'model name' /proc/cpuinfo | grep -i 'amd')" ]]; then
	# 开源驱动 AMDGPU
	pacman -S --noconfirm amd-ucode mesa lib32-mesa xf86-video-amdgpu vulkan-radeon lib32-vulkan-radeon
	# 开源 ATI 驱动
	# xf86-video-ati
fi

systemctl enable dhcpcd
systemctl enable sddm

sed -i 's#GRUB_CMDLINE_LINUX_DEFAULT=.*#GRUB_CMDLINE_LINUX_DEFAULT="loglevel=5 nowatchdog"#g' /etc/default/grub
# grub-install --target=x86_64-efi --efi-directory=/boot/efi --bootloader-id=ARCH
grub-install --target=x86_64-efi --efi-directory=/boot --bootloader-id=ARCH
grub-mkconfig -o /boot/grub/grub.cfg