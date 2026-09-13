#!/usr/bin/env bash

set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
DOTS_DIR="$DOTFILES_DIR/dots"

# Packages that must never have their directories folded into a single symlink.
# These target directories the application also writes its own state into, so a
# folded symlink would make that state land inside this repo. Keep in sync with
# stow_no_folding_packages in ansible/roles/stow/tasks/main.yml.
NO_FOLDING_PACKAGES=(kdenlive)

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
  stow | unstow | restow)
    ACTION="$1"
    shift
    ;;
  -h | --help)
    usage
    ;;
  esac
fi

case "$ACTION" in
stow) STOW_FLAG="" ;;
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
  FOLD_FLAG=""
  for nf in "${NO_FOLDING_PACKAGES[@]}"; do
    if [[ "$pkg" == "$nf" ]]; then
      FOLD_FLAG="--no-folding"
      break
    fi
  done

  echo "${ACTION}ing $pkg..."
  # shellcheck disable=SC2086
  stow -d "$DOTS_DIR" -t "$HOME" $STOW_FLAG $FOLD_FLAG "$pkg"
done

echo "Done."
