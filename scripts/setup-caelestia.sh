#!/usr/bin/env bash
set -euo pipefail

echo "Installing and applying Caelestia shell..."

if [ "${HYPRLAND_SCRIPT_SKIP_CAELESTIA:-0}" -eq 1 ]; then
    echo "Caelestia setup skipped by option."
    exit 0
fi

AUR_PACKAGE="caelestia-shell"

run_pacman() {
    if [ "$EUID" -eq 0 ]; then
        pacman "$@"
    else
        sudo pacman "$@"
    fi
}

if [ "$EUID" -eq 0 ]; then
    if [ -z "${SUDO_USER:-}" ] || [ "${SUDO_USER}" = "root" ]; then
        echo "Caelestia AUR install needs a non-root user context."
        echo "Run the installer as a regular user or use --skip-caelestia."
        exit 1
    fi
    TARGET_USER="$SUDO_USER"
else
    TARGET_USER="$(id -un)"
fi

TARGET_HOME="$(getent passwd "$TARGET_USER" | cut -d: -f6)"

if [ -z "$TARGET_HOME" ]; then
    echo "Unable to resolve home directory for user $TARGET_USER."
    exit 1
fi

if [ "$EUID" -eq 0 ] && ! command -v sudo > /dev/null 2>&1; then
    echo "Root mode requires sudo to run AUR commands as $TARGET_USER."
    echo "Install sudo or rerun as a regular user."
    exit 1
fi

run_as_target_user() {
    local cmd="$1"
    if [ "$EUID" -eq 0 ]; then
        sudo -u "$TARGET_USER" env HOME="$TARGET_HOME" bash -lc "$cmd"
    else
        bash -lc "$cmd"
    fi
}

install_yay_bin() {
    echo "No AUR helper found. Bootstrapping yay-bin..."
    run_pacman -S --needed --noconfirm base-devel git
    run_as_target_user 'TMP_DIR="$(mktemp -d)"; trap '\''rm -rf "$TMP_DIR"'\'' EXIT; git clone --depth 1 https://aur.archlinux.org/yay-bin.git "$TMP_DIR/yay-bin"; cd "$TMP_DIR/yay-bin"; makepkg -si --noconfirm'
}

install_caelestia_with_helper() {
    if command -v yay > /dev/null 2>&1; then
        run_as_target_user "yay -S --needed --noconfirm --answerclean None --answerdiff None $AUR_PACKAGE"
        return
    fi

    if command -v paru > /dev/null 2>&1; then
        run_as_target_user "paru -S --needed --noconfirm $AUR_PACKAGE"
        return
    fi

    install_yay_bin
    run_as_target_user "yay -S --needed --noconfirm --answerclean None --answerdiff None $AUR_PACKAGE"
}

install_caelestia_with_helper

HYPRLAND_CONF="$TARGET_HOME/.config/hypr/hyprland.conf"
mkdir -p "$(dirname "$HYPRLAND_CONF")"
touch "$HYPRLAND_CONF"

if grep -Eq '^[[:space:]]*exec-once[[:space:]]*=.*caelestia[[:space:]]+shell([[:space:]]|$)' "$HYPRLAND_CONF"; then
    echo "Caelestia autostart already present in $HYPRLAND_CONF"
else
    {
        echo ""
        echo "# Auto-start Caelestia shell"
        echo "exec-once = caelestia shell"
    } >> "$HYPRLAND_CONF"
    echo "Added Caelestia autostart to $HYPRLAND_CONF"
fi

echo "Caelestia shell installation and apply completed."
