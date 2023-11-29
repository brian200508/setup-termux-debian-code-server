#!/bin/bash
REPO_DIR_DISTRO=/sdcard/Download
REPO_DIR_TERMUX=~/storage/shared/Download
REPO_NAME=setup-termux-debian-code-server
SHORTCUTS_DIR=.shortcuts
#FIXME: VERSION=4.19.0

# download code-server
termux-setup-storage
apt update -y
apt install -y curl wget
echo "Downloading code-server..."
cd ~
#FIXME: wget -O ~/code-server-install.deb 'https://github.com/coder/code-server/releases/download/v${VERSION}code-server_${VERSION}_arm64.deb'
wget -O ~/code-server-install.deb 'https://github.com/coder/code-server/releases/download/v4.19.0/code-server_4.19.0_arm64.deb'
mv ./code-server-install.deb $REPO_DIR_TERMUX

# shortcut
echo "Setting up Termux Widget Debian shortcut..."
cd ~
mkdir $SHORTCUTS_DIR
cp $REPO_DIR_TERMUX/$REPO_NAME/shortcuts/debian-code-server.sh $SHORTCUTS_DIR
chmod +x $REPO_DIR_TERMUX/$REPO_NAME/debian-code-server.sh
mkdir $SHORTCUTS_DIR/icons
cp $REPO_DIR_TERMUX/$REPO_NAME/shortcuts/icons/debian-code-server.sh.png $SHORTCUTS_DIR/icons

# install Proot-Distro Debian
echo "Setting up Proot-Distro Debian..."
apt install -y git build-essential
apt install -y proot-distro
proot-distro install debian
proot-distro login debian -- apt update -y
proot-distro login debian -- apt install -y git build-essential python-is-python3 python3 python3-pip nodejs npm

# install code-server
echo "Setting up code-server..."
proot-distro login debian -- apt install -y $REPO_DIR_DISTRO/code-server-install.deb

# add to .bashrc
echo "Adding code-server to .bashrc for autostart..."
echo '' >> ~/.bashrc
echo '#Start code-server if not running' >> ~/.bashrc
echo 'if ps aux | grep -q "[c]ode-server --auth none --port 13880" ; then echo "code-server is already running." ; else proot-distro login debian -- code-server --auth none --port 13880 ; fi' >> ~/.bashrc
echo '' >> ~/.bashrc

echo "Done :)"
echo ""
echo "Start code-server with:"
echo "    proot-distro login debian -- code-server --auth none --port 13880"
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
