# Hyprland Script

Hyprland Script is a simple, modular, and safe installer for a Hyprland environment
on Arch Linux.

## Features

- Installs Hyprland and essential packages
- Automatically clones and sets up hyprland-dotfiles
- Modular scripts for future extensions (Waybar, themes, etc.)
- Safe config copy (doesn't overwrite existing files)

## Requirements

- Arch Linux or Arch-based distro
- Bash
- Git
- Internet connection
- User with sudo privileges

## structure:

hyprland-script/
├── install.sh
├── scripts/
│   ├── check-deps.sh
│   ├── install-packages.sh
│   └── setup-dotfiles.sh
├── config/
│   └── hypr/
├── docs/
├── README.md
├── CHANGELOG.md
└── LICENSE



## Installation

```bash
git clone https://github.com/Yugos06/hyprland-script.git
cd hyprland-script
chmod +x install.sh
./install.sh
