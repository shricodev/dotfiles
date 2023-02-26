set fish_greeting ""

if status is-interactive
    # Commands to run in interactive sessions can go here
end

# aliases
alias ls "ls -p -G"
alias la "ls -A"
alias ll "ls -l"
alias lla "ll -A"

starship init fish | source
set -x PATH $PATH /usr/local/go/bin
