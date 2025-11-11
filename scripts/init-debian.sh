#!/usr/bin/env bash

# sed -i 's/deb.debian.org/pods.pkgs.top/g' /etc/apt/sources.list

# read -p "==> Please input User name: " userName

while [[ -z $userName ]]; do
  read -p "==> Please input User name: " userName
done

while [[ -z $userPassword ]]; do
  read -s -p "==> Please input User password: " userPassword
  echo -ne "\r\n"
done

echo "${userName}:${userPassword}"

# if [[ -z "$(grep '^staff:' /etc/group)" ]]; then
#   echo "==> Add staff Group"
#   groupadd -f staff
# fi

if [[ -z "$(command -v zsh)" ]]; then
  apt-get update
  apt-get install -y zsh
fi

if [[ -z "$(grep "^${userName}:" /etc/passwd)" ]]; then
  echo "==> Add ${userName} User"
  useradd --create-home -s /usr/bin/zsh --groups sudo ${userName}
  echo "${userName}:${userPassword}" | chpasswd
fi


