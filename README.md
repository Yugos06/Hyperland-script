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

structure:

hyprland-script/
├── install.sh
├── scripts/
│   ├── install-packages.sh
│   ├── check-deps.sh
│   └── setup-hypr-config.sh
├── config/
│   └── hypr/
│       └── hyprland.conf
├── docs/
├── README.md
└── LICENSE




## Installation

```bash
git clone https://github.com/Yugos06>/hyprland-script.git
cd hyprland-script
chmod +x install.sh
./install.sh


