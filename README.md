# Hyprland Script

Simple installer for a usable Hyprland desktop on Arch Linux (or Arch-based distros).

## Features

- Installs Hyprland essentials, including `kitty`, `waybar`, `wofi`, `hyprpaper`
- Installs supporting desktop/runtime packages (portal, audio, notifications, polkit)
- Installs and applies `caelestia-shell` automatically (AUR)
- Checks dependencies and fails early with actionable messages
- Optional dotfiles setup from `prasanthrangan/hyprdots`
- Safer defaults: no overwrite of existing `~/.config/hypr`

## Requirements

- Arch Linux or Arch-based distro (`pacman` required)
- Bash
- Git
- Internet connection
- `sudo` if running as a non-root user

## Project structure

```text
hyprland-script/
├── install.sh
├── scripts/
│   ├── check-deps.sh
│   ├── install-packages.sh
│   ├── setup-dotfiles.sh
│   └── setup-caelestia.sh
├── README.md
├── CHANGELOG.md
└── LICENSE
```

## Installation

```bash
git clone https://github.com/Yugos06/hyprland-script.git
cd hyprland-script
chmod +x install.sh
./install.sh
```

## Options

```bash
./install.sh --yes
./install.sh --skip-dotfiles
./install.sh --skip-caelestia
./install.sh --yes --skip-dotfiles
```
