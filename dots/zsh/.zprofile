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

