
# Changelog

## v0.4.0
- Added automatic `caelestia-shell` installation from AUR
- Added automatic Caelestia apply by injecting `exec-once = caelestia shell` into Hyprland config
- Added installer option `--skip-caelestia`
- Added bootstrap fallback for AUR helper (`yay-bin`) when no AUR helper is installed

## v0.3.0
- Added installer flags: `--yes` and `--skip-dotfiles`
- Hardened scripts with `set -euo pipefail` and safer checks
- Improved dependency checks for Arch-based systems
- Expanded default package list (kitty, audio, portal, notifications, polkit, file manager)
- Improved dotfiles setup flow (`--depth 1`, cleanup trap, better source detection)
- Updated README with accurate usage and options

## v0.2.0
- Added automatic hyprland-dotfiles installation
- Removed old setup-hypr-config.sh
- Scripts modular and safe
- Project ready to clone and run
