# My fish config. Not much to see here; just some pretty standard stuff.

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/.config/emacs/bin $HOME/Applications /var/lib/flatpak/exports/bin/ $HOME/go/bin $HOME/.fzf/bin $fish_user_paths

#if command -q fastfetch
#  fastfetch --file-raw $HOME/.config/fastfetch/cat-ascii.txt
#end

#Remove fish vi mode indication in the prompt
function fish_mode_prompt; end

# init starship quickly
starship init fish | source

set fish_greeting # Suppress fish's intro message

# use the default terminal color
set TERM xterm-256color # Sets the terminal type

# Use the machhiato theme for the bat command
set -gx BAT_THEME "Rose Pine"

# -- layout=reverse makes the prompt at the top instead of at the bottom
set -gx FZF_DEFAULT_OPTS "--height=50% --layout=reverse --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down"

# Use this command to list files in the fzf window when simply run the 'fzf' command.
# Make sure to use the CTRL-T and ALT-C to its fullest.
set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window=right:noborder"
set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --icons --color=always {} | head -n 200' --preview-window=right:noborder"

fish_config theme choose "Rosé Pine"

#set up NEOVIM as a default editor.
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim

# Always use a block cursor
set -g fish_cursor_default block
set -g fish_cursor_insert block
set -g fish_cursor_replace block
set -g fish_cursor_visual block

# For obsidian and my custom scripts to work
if test -d ~/bin
  # Add ~/bin to the PATH using fish_add_path function
  fish_add_path ~/bin
end

# Function for creating a backup file
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    cp $filename $filename.bak
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end

# Either attach or create a new tmux session
function tt
  tmux new-session -A -s $argv
end

function mcdir 
  mkdir -p $argv; and cd $argv
end

### Navigation UTIL functions
# Change directory and list files
function cdl
  cd $argv && ls
end
### EOF Navigation UTIL functions

#Setup SSH running. (mostly for git push)
if not set -q SSH_AUTH_SOCK
  # Redirecting the error or the output to the /dev/null
    eval (ssh-agent -c) > /dev/null 2>&1
end

# If we are in this line, the ssh-agent should always be set up and running.
# Add our private key to the ssh-agent
# Redirecting the error or the output to the /dev/null
ssh-add ~/.ssh/gh_login_shricodev > /dev/null 2>&1
#End of SSH setup

#This is the private key for my homelab vm on azure
ssh-add ~/.ssh/homelab-vm_key.pem > /dev/null 2>&1

# Open tmux as default when the shell starts
# Attach to or create the base session
if not set -q TMUX
  set -g TMUX tmux new-session -d -s code-self
  eval $TMUX
  tmux attach-session -d -t code-self
end


### ALIASES ###
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

alias ping="ping -c 10"

alias cat='bat --style=plain --paging=never'

# vim and emacs
alias nv='nvim'
alias v='nvim'

alias cl='reset'
# Make the `clear` command work as Ctrl - l as by default `clear` command clears
# the screen completely
alias clear='reset'

alias clear-hard='command clear'
alias clhard='command clear'

# Changing "ls" to "eza"
alias ls='eza -alg --color=always --icons --group-directories-first' # my preferred listing
#alias to use when you need to access the raw ls command
alias lsraw='command ls'

alias ll='eza -lg --color=always --icons --group-directories-first'

alias la='eza -a --color=always --git-ignore --group-directories-first' # all files and dirs
alias lt1='eza -aT --color=always --git-ignore --level=1 --group-directories-first'
alias lt2='eza -aT --color=always --git-ignore --level=2 --group-directories-first'
alias lt3='eza -aT --color=always --git-ignore --level=3 --group-directories-first'

alias llg="eza --tree --level=2 --long -g --icons --git"

# Show only the dotfiles
alias l.='eza -a | grep -E "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'

# adding flags
alias df='df -h' # human-readable sizes
alias free='free -m' # show sizes in MB

# Fuzzily find history
alias hf='history | fzf'

# Continue from where the download got interrupted if it happens. 
# Without -c flag, wget will start downloading the file from scratch if the operation fails due to some 
# network issues.
alias wget="wget -c"

alias lg="lazygit"

# switch between shells
# The shell path is hard coded for now since adding $(which <shell>) would result in warning in the terminal
# if the shell is not installed.
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

# Safety nets
# do not delete / or prompt if deleting more than 3 files at a time 
alias rm='rm -I --preserve-root'
 
# confirmation
alias mv='mv -i'
alias cp='cp -i'
alias ln='ln -i'
 
# Parenting changing perms on /
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# git aliases
alias gl='git log --oneline'
alias glp='git log --pretty=format:"%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s"' 
alias glt='git log --graph --oneline --all --decorate'

# HTTP requests with xh! Make sure to have it installed.
alias http="xh"

# Yazi file manager
alias yz='yazi'

alias :q="exit"

alias day="date +'%Y-%m-%d %A'"

# Weather in current location
alias wtr="curl wttr.in"

# Do the internet speed test
alias ist="curl -s 'https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py' | python3 -"

# Some flatpak aliases
# alias zen='flatpak run io.github.zen_browser.zen'

abbr -a --position anywhere --set-cursor='%' -- L '% | less'

# This is telling zoxide to use cd command to move to the directories instead of the z command.
# The cd command not aliases to the z command. z is no longer available.
#zoxide init --cmd cd fish | source

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH

# pnpm
set -gx PNPM_HOME "/home/shricodev/.local/share/pnpm"
if not string match -q -- $PNPM_HOME $PATH
  set -gx PATH "$PNPM_HOME" $PATH
end

bind \cd delete-char  # Don't exit on accidental Ctrl-D
bind \cd\cd\cd delete-or-exit  # Exit on the third one

zoxide init fish | source

