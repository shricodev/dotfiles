# Zinit Plugin Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# Plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

# OMZ snippets
zinit snippet OMZP::sudo

# PATH
typeset -U path  # deduplicate PATH entries
path=(
    "$HOME/.bin"
    "$HOME/.local/bin"
    "$HOME/local/bin"
    "$HOME/.config/emacs/bin"
    "$HOME/Applications"
    "/var/lib/flatpak/exports/bin"
    "$HOME/go/bin"
    "$HOME/.fzf/bin"
    $path
)

# Bun
if [[ -d "$HOME/.bun" ]]; then
    export BUN_INSTALL="$HOME/.bun"
    path=("$BUN_INSTALL/bin" $path)
fi

# Npm global
if [[ -d "$HOME/.npm-global" ]]; then
    export NPM_INSTALL="$HOME/.npm-global"
    path=("$NPM_INSTALL/bin" $path)
fi

# pnpm
if [[ -d "$HOME/.local/share/pnpm" ]]; then
    export PNPM_HOME="$HOME/.local/share/pnpm"
    path=("$PNPM_HOME" $path)
fi

# Rust / Cargo
[[ -f "$HOME/.cargo/env" ]] && source "$HOME/.cargo/env"

# Environment
export EDITOR=nvim
export GIT_EDITOR=nvim

# History
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase

setopt appendhistory
setopt sharehistory
setopt extendedglob
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

unsetopt autocd beep notify

# Vi mode + Key bindings
bindkey -v
export KEYTIMEOUT=15  # 150ms escape delay (snappy jk)

bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

# jk to exit insert mode (like fish config)
bindkey -M viins 'jk' vi-cmd-mode

# Ctrl-D: delete-char instead of exit (triple Ctrl-D to exit, like fish)
setopt ignore_eof  # prevents single Ctrl-D from closing the shell
bindkey -M viins '^D' delete-char
bindkey -M vicmd '^D' delete-char

# Completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

autoload -Uz compinit && compinit
zinit cdreplay -q

# FZF Configuration
export FZF_DEFAULT_OPTS="--height=65% --layout=reverse --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window=right:noborder"
export FZF_ALT_C_OPTS="--preview 'eza --tree --icons --color=always {} | head -n 200' --preview-window=right:noborder"

# Aliases (can be bypassed with 'command ls', 'command cat', etc.)
# File operations
alias ls='eza --color=always --icons --group-directories-first'
alias cat='bat --style=plain --paging=never'
alias ll='eza -lg --color=always --icons --group-directories-first'
alias la='eza -a --color=always --git-ignore --group-directories-first'
alias llg='eza --tree --level=2 --long -g --icons --git'
alias l.='eza -a --color-scale=none | grep -E "^\."'

# Safety aliases
alias rm='rm -I --preserve-root'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# Editor
alias nv='nvim'
alias vi='nvim'
alias vim='nvim'
alias v='nvim'

# System
alias cl='reset'
alias ping='ping -c 10'
alias df='df -h'
alias free='free -h'
alias wget='wget -c'
alias hf='history | fzf'
alias grep='grep --color=auto'

# Git
alias lg='lazygit'
alias gl='git log --oneline'
alias glp='git log --pretty=format:"%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s"'
alias glt='git log --graph --oneline --all --decorate'

# Utilities
alias yz='yazi'
alias ':q'='exit'
alias day='date +"%Y-%m-%d %A"'
alias wtr='curl wttr.in'
alias tt='tmux new-session -A -s'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# Functions
# cd into a directory and list contents
cdl() { cd "$1" && ls; }

# Create a directory and cd into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# Tree listing with depth; uses tree or eza
lt() {
    local depth=1 path="."
    if [[ "$1" =~ ^[0-9]+$ ]]; then
        depth="$1"; shift
    fi
    if [[ -n "$1" ]]; then
        path="$1"; shift
    fi
    if (( $+commands[tree] )); then
        command tree -a -C --dirsfirst --gitignore -L "$depth" "$path" "$@"
    elif (( $+commands[eza] )); then
        command eza -aT --color=always --git-ignore --level="$depth" --group-directories-first "$path" "$@"
    else
        echo "lt: required command not found: install 'tree' or 'eza'" >&2
        return 127
    fi
}

# SSH Agent
if [[ -z "$SSH_AUTH_SOCK" ]]; then
    eval "$(ssh-agent -s)" >/dev/null 2>&1
fi

if [[ -n "$SSH_AUTH_SOCK" ]]; then
    _ssh_keys=(
        "$HOME/.ssh/gh_login_shricodev"
        "$HOME/.ssh/homelab-vm_key.pem"
    )
    for key in "${_ssh_keys[@]}"; do
        [[ -f "$key" ]] && ssh-add "$key" >/dev/null 2>&1
    done
    unset _ssh_keys
fi

# Shell integrations (keep at the end)
eval "$(starship init zsh)"
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"

# Auto-attach to tmux (like fish config)
if [[ -z "$TMUX" ]] && [[ -t 0 ]]; then
    tmux new-session -A -s mainline
fi
