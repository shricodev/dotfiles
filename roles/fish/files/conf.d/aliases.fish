# Resolved at execution time (can be bypassed with 'command')

# Only set up aliases in interactive shells (except grep which is useful in scripts)
if not status is-interactive
    # Colorize grep output even in scripts
    alias grep='grep --color=auto'
    exit
end

# File operations - using aliases so they can be bypassed with 'command ls' or 'command cat'
alias ls='eza -alg --color=always --icons --group-directories-first'
alias cat='bat --style=plain --paging=never'

# Safety aliases - add interactive prompts to dangerous commands
alias rm='rm -I --preserve-root'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

alias grep='grep --color=auto'
