#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTS_DIR="$DOTFILES_DIR/dots"

usage() {
    echo "Usage: $0 [stow|unstow|restow] [package...]"
    echo ""
    echo "Commands:"
    echo "  stow     Symlink packages to \$HOME (default)"
    echo "  unstow   Remove symlinks from \$HOME"
    echo "  restow   Re-symlink packages (unstow + stow)"
    echo ""
    echo "If no packages are specified, operates on all packages."
    exit 1
}

get_all_packages() {
    find "$DOTS_DIR" -mindepth 1 -maxdepth 1 -type d -printf '%f\n' | sort
}

ACTION="stow"
if [[ $# -gt 0 ]]; then
    case "$1" in
        stow|unstow|restow)
            ACTION="$1"
            shift
            ;;
        -h|--help)
            usage
            ;;
    esac
fi

case "$ACTION" in
    stow)   STOW_FLAG="" ;;
    unstow) STOW_FLAG="-D" ;;
    restow) STOW_FLAG="-R" ;;
esac

if [[ $# -gt 0 ]]; then
    PACKAGES=("$@")
else
    mapfile -t PACKAGES < <(get_all_packages)
fi

for pkg in "${PACKAGES[@]}"; do
    if [[ ! -d "$DOTS_DIR/$pkg" ]]; then
        echo "Warning: package '$pkg' not found in $DOTS_DIR, skipping."
        continue
    fi
    echo "${ACTION}ing $pkg..."
    # shellcheck disable=SC2086
    stow -d "$DOTS_DIR" -t "$HOME" $STOW_FLAG "$pkg"
done

echo "Done."
