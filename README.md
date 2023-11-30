# setup-termux-debian-code-server
Setup Termux with minimal Proot-Distro running code-server.

## Steps
### Prerequisites
Install Termux at first.
- Install Termux App (see https://github.com/termux/termux-app/releases).
- Clone this repo:

```bash
termux-setup-storage && pkg update -y && pkg install -y git build-essential
```

```bash
git clone https://github.com/brian200508/setup-termux-debian-code-server ~/storage/shared/Download/setup-termux-debian-code-server
```

## Install Debian
Install proot-distro Debian with code-server and Termux Widget shortcuts.

```bash
cd ~ && cp ~/storage/shared/Download/setup-termux-debian-code-server/install-debian.sh . &&  chmod +x ~/install-debian.sh && ./install-debian.sh
```

## Or: Install Ubuntu
Install proot-distro Ubuntu with code-server and Termux Widget shortcuts.

```bash
cd ~ && cp ~/storage/shared/Download/setup-termux-debian-code-server/install-ubuntu.sh . &&  chmod +x ~/install-ubuntu.sh && ./install-ubuntu.sh
```

## Optionally remove this Git repository clone

```bash
rm ~/install-debian.sh
```

or:
```bash
rm ~/install-ubuntu.sh
```

```bash
rm -rf /sdcard/Download/setup-termux-debian-code-server
```

Done.

## Projects referred
 - code-server (https://github.com/coder/code-server)
 - Termux App (https://github.com/termux/termux-app)
 - Termux Widget (see https://github.com/termux/termux-widget)
 - VSCode/Code-OSS (https://github.com/microsoft/vscode)

Very best regards and Thanks to all of You. Great work!!! :)
