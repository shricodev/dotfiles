# My fish config. Not much to see here; just some pretty standard stuff.
# Open tmux as default when the shell starts
if not set -q TMUX
    set -g TMUX tmux new-session -d -s base
    eval $TMUX
    tmux attach-session -d -t base
end

### ADDING TO THE PATH
# First line removes the path; second line sets it.  Without the first line,
# your path gets massive and fish becomes very slow.
set -e fish_user_paths
set -U fish_user_paths $HOME/.bin $HOME/.local/bin $HOME/.config/emacs/bin $HOME/Applications /var/lib/flatpak/exports/bin/ $HOME/go/bin $fish_user_paths

### EXPORT ###
set fish_greeting # Supresses fish's intro message
# use the default terminal color
# set TERM screen-256color # Sets the terminal type

set -gx EDITOR "nvim"
set -gx VISUAL "nvim"

# Use the machhiato theme for the bat command
set -gx BAT_THEME "Catppuccin-macchiato"

set -gx KUBECONFIG "~/.kube/config"

# Use this command to list files in the fzf window when simply run the 'fzf' command.
set -gx FZF_DEFAULT_COMMAND "fdfind --type f --hidden --follow"

# Use the machhiato theme for the fish shell
fish_config theme choose "Catppuccin Macchiato"

### SET MANPAGER
### "less" as manpager
set -x MANPAGER "less"

### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
    # fish_default_key_bindings
    fish_vi_key_bindings
    # Use jk to change the mode from insert to normal in the terminal
    bind -M insert -m default jk backward-char force-repaint
end

### FUNCTIONS ###

# Functions needed for !! and !$
function __history_previous_command
    switch (commandline -t)
        case "!"
            commandline -t $history[1]
            commandline -f repaint
        case "*"
            commandline -i !
    end
end

function __history_previous_command_arguments
    switch (commandline -t)
        case "!"
            commandline -t ""
            commandline -f history-token-search-backward
        case "*"
            commandline -i '$'
    end
end

# The bindings for !! and !$
if [ "$fish_key_bindings" = fish_vi_key_bindings ]
    bind -Minsert ! __history_previous_command
    bind -Minsert '$' __history_previous_command_arguments
else
    bind ! __history_previous_command
    bind '$' __history_previous_command_arguments
end

# For obsidian to work
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

# Function for copying files and directories, even recursively.
# ex: copy DIRNAME LOCATIONS
# result: copies the directory and all of its contents.
function copy
    set count (count $argv | tr -d \n)
    if test "$count" = 2; and test -d "$argv[1]"
        set from (echo $argv[1] | trim-right /)
        set to (echo $argv[2])
        command cp -r $from $to
    else
        command cp $argv
    end
end

# Function for printing a column (splits input on whitespace)
# ex: echo 1 2 3 | coln 3
# output: 3
# function coln
#     while read -l input
#         echo $input | awk '{print $'$argv[1]'}
#     end
# end

# Function for printing a row
# ex: seq 3 | rown 3
# output: 3
function rown --argument index
    sed -n "$index p"
end

# Function for ignoring the first 'n' lines
# ex: seq 10 | skip 5
# results: prints everything but the first 5 lines
function skip --argument n
    tail +(math 1 + $n)
end

# Function for taking the first 'n' lines
# ex: seq 10 | take 5
# results: prints only the first 5 lines
function take --argument number
    head -$number
end

# Function for org-agenda
function org-search -d "send a search string to org-mode"
    set -l output (/usr/bin/emacsclient -a "" -e "(message \"%s\" (mapconcat #'substring-no-properties \
        (mapcar #'org-link-display-format \
        (org-ql-query \
        :select #'org-get-heading \
        :from  (org-agenda-files) \
        :where (org-ql--query-string-to-sexp \"$argv\"))) \
        \"
    \"))")
    printf $output
end

### END OF FUNCTIONS ###


### ALIASES ###
# navigation
alias ..='cd ..'
alias ...='cd ../..'
alias .3='cd ../../..'
alias .4='cd ../../../..'
alias .5='cd ../../../../..'

# vim and emacs
alias nv='nvim'

alias cl="clear"

# Changing "ls" to "eza"
alias ls='eza -al --color=always --icons --group-directories-first' # my preferred listing

alias la='eza -a --color=always --group-directories-first' # all files and dirs
alias ll='eza -l --color=always --icons --group-directories-first' # long format
alias lt='eza -aT --color=always --group-directories-first' # tree listing
alias llg="eza --tree --level=2 --long --icons --git"

# Show only the dotfiles
alias l.='eza -a | egrep "^\."'

# Colorize grep output (good for log files)
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# adding flags
alias df='df -h' # human-readable sizes
alias free='free -m' # show sizes in MB

# ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"
alias psmem='ps auxf | sort -nr -k 4'
alias pscpu='ps auxf | sort -nr -k 3'

# Merge Xresources
alias merge='xrdb -merge ~/.Xresources'

# peco
alias hf='history | peco --layout=bottom-up'

# git
alias addup='git add -u'
alias addall='git add .'
alias branch='git branch'
alias checkout='git checkout'
alias clone='git clone'
alias commit='git commit -m'
alias remote='git remote -v'
alias fetch='git fetch'
alias pull='git pull origin'
alias push='git push origin'
alias tag='git tag'
alias newtag='git tag -a'

alias lg="lazygit"

# get error messages from journalctl
alias jctl="journalctl -p 3 -xb"

# alias to use 'batcat' with cat command
alias bt="batcat"
alias bat="batcat"

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

alias k="kubectl"
alias ka="kubectl apply -f"
alias kg="kubectl get"
alias kd="kubectl describe"
alias kdel="kubectl delete"
alias kl="kubectl logs"
alias kgpo="kubectl get pod"
alias kgd="kubectl get deployments"
alias kc="kubectx"
alias kns="kubens"
alias kl="kubectl logs -f"
alias ke="kubectl exec -it"
alias kcns='kubectl config set-context --current --namespace'

# HTTP requests with xh! Make sure to have it installed.
alias http="xh"

# Ranger file manager alias
alias rr='ranger'

# Setup the ssh-agent with our ssh private key.
if test -z "$SSH_AUTH_SOCK"
    eval (ssh-agent -c > /dev/null)
    ssh-add ~/.ssh/github_shricodev >/dev/null 2>&1
end

# Either attach or create a new tmux session
function tt
  tmux new-session -A -s $argv
end

### Navigation UTIL functions
# Change directory and list files
function cdl
  cd $argv && ls
end

# Use fzf to change directory and list the contents of the directory
function fcl
  cd "$(find . -type d -not -path '*/.*' | fzf)" && ls
end

# Use fzf to choose file and copy the file path to the clipboard
function ffp
  echo "$(find . -type f -not -path '*/.*' | fzf)" | xsel
end

# Open a file from fzf list in neovim
function ffn
  nvim "$(find . -type f -not -path '*/.*' | fzf)"
end
### EOF Navigation UTIL functions

abbr -a --position anywhere --set-cursor='%' -- L '% | less'

# This is telling zoxide to use cd command to move to the directories instead of the z command.
# The cd command not aliases to the z command. z is no longer available.
# zoxide init --cmd cd fish | source

# Make cd to use zoxide
zoxide init --cmd cd fish | source
starship init fish | source
