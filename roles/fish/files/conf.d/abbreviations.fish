# Fish abbreviations - faster than aliases
# These expand when you press space or enter

# Only set up abbreviations in interactive shells
if not status is-interactive
    exit
end

# Navigation abbreviations
abbr -a .. 'cd ..'
abbr -a ... 'cd ../..'
abbr -a .3 'cd ../../..'
abbr -a .4 'cd ../../../..'
abbr -a .5 'cd ../../../../..'

# Directory operations
abbr -a --position anywhere --set-cursor='%' cdl 'cd % && ls'

# File operations
abbr -a ll 'eza -lg --color=always --icons --group-directories-first'
abbr -a la 'eza -a --color=always --git-ignore --group-directories-first'
abbr -a llg 'eza --tree --level=2 --long -g --icons --git'
abbr -a l. 'eza -a --color=never | grep -E "^\."'

# Editor abbreviations
abbr -a nv nvim
abbr -a vi nvim
abbr -a vim nvim
abbr -a v nvim

# System abbreviations
abbr -a cl reset
abbr -a clear reset
abbr -a ping 'ping -c 10'
abbr -a df 'df -h'
abbr -a free 'free -m'
abbr -a wget 'wget -c'
abbr -a hf 'history | fzf'

# Git abbreviations
abbr -a lg lazygit
abbr -a gl 'git log --oneline'
abbr -a glp 'git log --pretty=format:"%C(yellow)%h%Creset - %C(green)%an%Creset, %ar : %s"'
abbr -a glt 'git log --graph --oneline --all --decorate'

# Shell switching
abbr -a tobash 'sudo chsh $USER -s /bin/bash && echo "Now log out."'
abbr -a tozsh 'sudo chsh $USER -s /bin/zsh && echo "Now log out."'
abbr -a tofish 'sudo chsh $USER -s /bin/fish && echo "Now log out."'

# Utilities
abbr -a yz yazi
abbr -a :q exit
abbr -a day 'date +"%Y-%m-%d %A"'
abbr -a wtr 'curl wttr.in'
abbr -a tt 'tmux new-session -A -s'

# Special abbreviations with cursor positioning
abbr -a --position anywhere --set-cursor='%' -- L '% | less'
