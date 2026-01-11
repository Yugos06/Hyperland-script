#!/usr/bin/env bash
set -e

echo "Installing Hyprland packages..."

PACKAGES=(
  hyprland
  waybar
  kitty
  wofi
  grim
  slurp
  wl-clipboard
  xdg-desktop-portal-hyprland
)

sudo pacman -Syu --needed --noconfirm "${PACKAGES[@]}"

echo "Packages installed."


