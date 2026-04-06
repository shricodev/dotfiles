# load ssh agent before tmux so the tmux server inherits SSH_AUTH_SOCK
if command -v keychain >/dev/null 2>&1; then
  eval "$(keychain --eval --quiet gh_login_shricodev)"
fi

if command -v tmux >/dev/null 2>&1 && command -v tmuxp >/dev/null 2>&1; then
  if [[ -z "$TMUX" && -n "$TERM" && "$TERM" != "dumb" && -z "$SSH_TTY" ]]; then
    # with exec we are substituting the shell with tmux. so if tmux is closed
    # essentially the terminal will close as well.
    exec ~/.local/bin/tmux-start
  fi
fi


# Zinit Plugin Manager
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"

# History
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000

setopt appendhistory
setopt sharehistory
setopt extendedglob
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_find_no_dups

unsetopt autocd beep notify

# Vi mode + Key bindings
bindkey -v
export KEYTIMEOUT=10  # 100ms escape delay (snappy jk)

bindkey '^P' history-search-backward
bindkey '^N' history-search-forward

# jk to exit insert mode (like fish config)
bindkey -M viins 'jk' vi-cmd-mode

# by default vim mode in zsh is a bit weird. so this kinda helps.
bindkey -M viins '^W' backward-kill-word

# some terminals send backspace as ^? and some as ^H. so this helps in both case.
bindkey -M viins '^?' backward-delete-char
bindkey -M viins '^H' backward-delete-char

# Completions
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' menu no
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

# completion plugins load before compinit
zinit light zsh-users/zsh-completions
zinit light Aloxaf/fzf-tab

# OMZ snippets
zinit snippet OMZP::sudo

autoload -Uz compinit

# Smarter completion initialization
if [[ -n ~/.zcompdump(#qN.mh+24) ]]; then
  compinit
else
  compinit -C
fi

zinit cdreplay -q

# use ctrl + x and e to edit the command line using $EDITOR
autoload -Uz edit-command-line
zle -N edit-command-line
bindkey '^Xe' edit-command-line

# clear screen, keep buffer
clear-keep-buffer() {
  zle clear-screen
}
zle -N clear-keep-buffer
bindkey '^Xl' clear-keep-buffer

# copy current command to clipboard (works on both Wayland and X11)
clip-copy() {
  if [[ -n "$WAYLAND_DISPLAY" ]]; then
    echo -n "$1" | wl-copy
  else
    echo -n "$1" | xclip -selection clipboard
  fi
}

copy-command() {
  clip-copy "$BUFFER"
  zle -M "Copied to clipboard"
}
zle -N copy-command
bindkey '^Xc' copy-command

# FZF Configuration
export FZF_DEFAULT_OPTS="--height=50% --layout=default --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window=right:noborder"
export FZF_ALT_C_COMMAND="fd --type d --hidden --strip-cwd-prefix --exclude .git"
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
# clears visible screen but preserves scrollback (prompt moves to top)
alias cl='printf "\033[2J\033[H"'
alias clear='printf "\033[2J\033[H"'
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

# Deferred plugin loading for faster startup
zinit wait lucid light-mode for \
  zsh-users/zsh-autosuggestions \
  zsh-users/zsh-syntax-highlighting

# Functions
# cd into a directory and list contents
cdl() { cd "$1" && ls; }

# Create a directory and cd into it
mkcd() { mkdir -p "$1" && cd "$1"; }

# Shell integrations (keep at the end)
eval "$(starship init zsh)"
source <(fzf --zsh)
eval "$(zoxide init zsh)"
