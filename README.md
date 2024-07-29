# setup-termux-debian-code-server
Setup Termux with minimal Proot-Distro running code-server.

## Steps
### Prerequisites
Install Termux at first.
- Install Termux App (see https://github.com/termux/termux-app/releases).
- Setup storage access and install Git:

```bash
termux-setup-storage && apt update -y && apt install -y git
```

If ```termux-setup-storage``` will not work, You can use this as a workaround:
- Go to Android Setup Menu, search for ```Apps```, scroll to ```Termux``` and grant full Storage access to Termux.
- Afterwards open Termux and continue with:
```bash
apt update -y && apt install -y git
```

### Clone this repository
```bash
git clone https://github.com/brian200508/setup-termux-debian-code-server ~/storage/downloads/setup-termux-debian-code-server
```

## Install Debian
Install proot-distro Debian with code-server and Termux Widget shortcuts.

```bash
cd ~ && cp ~/storage/downloads/setup-termux-debian-code-server/install-debian.sh . &&  chmod +x ~/install-debian.sh && ./install-debian.sh
```

## Or: Install Ubuntu
Install proot-distro Ubuntu with code-server and Termux Widget shortcuts.

```bash
cd ~ && cp ~/storage/downloads/setup-termux-debian-code-server/install-ubuntu.sh . &&  chmod +x ~/install-ubuntu.sh && ./install-ubuntu.sh
```

## Optionally remove this Git repository clone

```bash
rm ~/install-debian.sh
```

or:
```bash
rm ~/install-ubuntu.sh
```

remove cloned repo:
```bash
rm -rf ~/storage/downloads/setup-termux-debian-code-server
```

Done.

## Projects referred
 - code-server (https://github.com/coder/code-server)
 - Termux App (https://github.com/termux/termux-app)
 - Termux Widget (see https://github.com/termux/termux-widget)
 - VSCode/Code-OSS (https://github.com/microsoft/vscode)

Very best regards and Thanks to all of You. Great work!!! :)
