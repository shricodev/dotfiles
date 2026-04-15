typeset -U path
path=(
    "$HOME/.bin"
    "$HOME/.local/bin"
    "$HOME/go/bin"
    $path
)

[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

export EDITOR=nvim
export GIT_EDITOR=nvim

# Cache npm prefix to avoid running npm on every login (~100-200ms savings)
if [[ -z "$NPM_PREFIX" ]]; then
  NPM_PREFIX=$(npm config get prefix 2>/dev/null)
fi
[ -n "$NPM_PREFIX" ] && export PATH="$NPM_PREFIX/bin:$PATH"
