#!/bin/bash
REPO_DIR_DISTRO=/sdcard/Download
REPO_DIR_TERMUX=~/storage/shared/Download
REPO_NAME=setup-termux-debian-code-server
SHORTCUTS_DIR=~/.termux/boot/
VERSION=4.19

# download code-server
termux-setup-storage
apt update -y
apt install -y curl
echo "Downloading code-server..."
cd ~
curl -fOL https://github.com/coder/code-server/releases/download/v$VERSION/code-server_${VERSION}_arm64.deb
mv ./code-server_${VERSION}_arm64.deb $REPO_DIR_TERMUX

# shortcut
echo "Setting up Termux:Boot Debian shortcut..."
cd ~
mkdir $SHORTCUTS_DIR
cp $REPO_DIR/boot/debian-code-server.sh $SHORTCUTS_DIR
chmod +x $SHORTCUTS_DIR/debian-code-server.sh

# install Proot-Distro Debian
echo "Setting up Proot-Distro Debian..."
apt install -y git build-essential
apt install proot-distro
proot-distro install debian
proot-distro login debian -- apt update -y
proot-distro login debian -- apt install -y git build-essential python-is-python3 python3 python3-pip nodejs npm

# install code-server
echo "Setting up code-server..."
proot-distro login debian -- apt install -y /sdcard/Download/code-server_*_arm64.deb
#proot-distro login debian -- code-server --auth none --port 8081
