# Set the directory we want to store zinit and plugins
ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"

# Download Zinit, if it's not there yet
if [ ! -d "$ZINIT_HOME" ]; then
   mkdir -p "$(dirname $ZINIT_HOME)"
   git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

# Source/Load zinit
source "${ZINIT_HOME}/zinit.zsh"

# nice zsh plugins
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-completions
zinit light zsh-users/zsh-autosuggestions
zinit light Aloxaf/fzf-tab

eval "$(starship init zsh)"

zinit snippet OMZP::sudo

# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=5000
SAVEHIST=5000
HISTDUP=erase

bindkey -v
bindkey '^p' history-search-backward
bindkey '^n' history-search-forward

setopt appendhistory
setopt sharehistory
setopt extendedglob
setopt hist_ignore_space
setopt hist_ignore_all_dups
setopt hist_save_no_dups
setopt hist_ignore_dups
setopt hist_find_no_dups

# case insensitive suggestion
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
# add colors in the suggestion
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
# use fzf like menu and not the default one
zstyle ':completion:*' menu no
# add preview in fzf tab
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'ls --color $realpath'
# make preview to work with zoxide
zstyle ':fzf-tab:complete:__zoxide_z:*' fzf-preview 'ls --color $realpath'

unsetopt autocd beep notify
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename '/home/shricodev/.zshrc'

autoload -Uz compinit && compinit
zinit cdreplay -q

alias ls='ls --color'

# shell integration
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
