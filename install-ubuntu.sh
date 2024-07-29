#!/bin/bash
REPO_DIR_DISTRO=~/storage/downloads
REPO_DIR_TERMUX=~/storage/downloads
REPO_NAME=setup-termux-debian-code-server
SHORTCUTS_DIR=.shortcuts
#FIXME: VERSION=4.91.1

# download code-server
#termux-setup-storage
pkg update -y
pkg install -y curl wget
echo "Downloading code-server..."
cd ~
#FIXME: wget -O ~/code-server-install.deb 'https://github.com/coder/code-server/releases/download/v${VERSION}code-server_${VERSION}_arm64.deb'
wget -O ~/code-server-install.deb 'https://github.com/coder/code-server/releases/download/v4.91.1/code-server_4.91.1_arm64.deb'
mv ./code-server-install.deb $REPO_DIR_TERMUX

# shortcut
echo "Setting up Termux Widget Ubuntu shortcut..."
cd ~
mkdir $SHORTCUTS_DIR
cp $REPO_DIR_TERMUX/$REPO_NAME/shortcuts/ubuntu-code-server.sh $SHORTCUTS_DIR
chmod +x $REPO_DIR_TERMUX/$REPO_NAME/ubuntu-code-server.sh
mkdir $SHORTCUTS_DIR/icons
cp $REPO_DIR_TERMUX/$REPO_NAME/shortcuts/icons/ubuntu-code-server.sh.png $SHORTCUTS_DIR/icons

# install Proot-Distro Ubuntu
echo "Setting up Proot-Distro Ubuntu..."
pkg install -y git build-essential
pkg install -y proot-distro
proot-distro install ubuntu
proot-distro login ubuntu -- apt update -y
proot-distro login ubuntu -- apt install -y git build-essential python-is-python3 python3 python3-pip python3-venv nodejs npm

# install code-server
echo "Setting up code-server..."
proot-distro login ubuntu -- apt install -y $REPO_DIR_DISTRO/code-server-install.deb

# add to .bashrc
echo "Adding code-server to .bashrc for autostart..."
echo '' >> ~/.bashrc
echo '#Start code-server if not running' >> ~/.bashrc
echo 'if ps aux | grep -q "[c]ode-server --auth none --port 13880" ; then echo "code-server is already running." ; else proot-distro login ubuntu -- code-server --auth none --port 13880 ; fi' >> ~/.bashrc
echo '' >> ~/.bashrc

echo "Done :)"
echo ""
echo "Start code-server with:"
echo "    proot-distro login ubuntu -- code-server --auth none --port 13880"
echo ""
echo "For automatically starting Termux with code-server progressive web app"
echo "at least for SAMSUNG devices You can do the following:"
echo "    1. goto localhost:13880 and install as progressive web app"
echo "    2. create new Routine:"
echo "       - IF App started > select code-server progressive web app"
echo "       - THEN Apps > Open App or execute App-Action > select Termux"
echo "       - save Routine"
echo ""

source ~/.bashrc
