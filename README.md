# setup-termux-debian-code-server
Setup Termux:Boot with minimal Proot-Distro running code-server.

## Steps
### Prerequisites
Install Termux at first.
- Install Termux App (see https://github.com/termux/termux-app/releases).
- Install Termux:Boot App (see https://github.com/termux/termux-boot/releases).
- Clone this repo:

```bash
termux-setup-storage && pkg update -y && pkg install -y git build-essential
```

```bash
git clone https://github.com/brian200508/setup-termux-debian-code-server ~/storage/shared/Download/setup-termux-debian-code-server
```

## Install
Install proot-distro Debian with code-server and Termux:Boot shortcuts.

```bash
cd ~ && cp ~/storage/shared/Download/setup-termux-debian-code-server/install-debian.sh . &&  chmod +x ~/setup-udroid-and-shortcuts.sh && ./install-debian.sh
```

## Optionally remove this Git repository clone

```bash
rm ~/install-debian.sh.sh
```

```bash
rm -rf /sdcard/Download/setup-termux-debian-code-server
```

Done.

## Projects referred
 - code-server (https://github.com/coder/code-server)
 - Termux App (https://github.com/termux/termux-app)
 - Termux:Boot (https://github.com/termux/termux-boot)
 - VSCode/Code-OSS (https://github.com/microsoft/vscode)
 - PlatformIO (https://platformio.org)
 
Very best regards and Thanks to all of You. Great work!!! :)
