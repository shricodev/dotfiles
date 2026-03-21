typeset -U path
path=(
    "$HOME/.bin"
    "$HOME/.local/bin"
    "$HOME/Applications"
    "/var/lib/flatpak/exports/bin"
    "$HOME/go/bin"
    $path
)

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

export EDITOR=nvim
export GIT_EDITOR=nvim

NPM_PREFIX=$(npm config get prefix 2>/dev/null)
[ -n "$NPM_PREFIX" ] && export PATH="$NPM_PREFIX/bin:$PATH"
