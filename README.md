# Hyprland Script

Hyprland Script is a simple and modular Hyprland environment bootstrapper.
It aims to provide a reproducible and understandable way to install and configure
a basic Hyprland setup on Arch Linux.

This project is mainly intended for learning purposes and experimentation.

## Features

- Automated Hyprland installation (Arch Linux)
- Modular install scripts
- Clean and readable structure
- Easy to extend and customize

## Requirements

- Arch Linux (or Arch-based distribution)
- Bash
- Internet connection
- User with sudo privileges

## Installation

```bash
git clone https://github.com/Yugos06>/hyprland-script.git
cd hyprland-script
chmod +x install.sh
./install.sh

here is the structure:

hyprland-script/
├── install.sh
├── scripts/
│ └── check-deps.sh
├── config/
│ └── hypr/
├── docs/
│ ├── installation.md
│ └── architecture.md
├── CHANGELOG.md
└── .gitignore
