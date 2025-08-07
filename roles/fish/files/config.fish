# My fish config. Not much to see here; just some pretty standard stuff.

fish_add_path \
    "$HOME/.bin" \
    "$HOME/.local/bin" \
    "$HOME/local/bin" \
    "$HOME/.config/emacs/bin" \
    "$HOME/Applications" \
    "/var/lib/flatpak/exports/bin" \
    "$HOME/go/bin" \
    "$HOME/.fzf/bin"

# Remove fish vi mode indication in the prompt
function fish_mode_prompt; end

# init starship quickly (only in interactive mode)
if status is-interactive
    starship init fish | source
end

# Suppress fish's intro message
set fish_greeting

# use the default terminal color
set TERM screen-256color

# set -gx BAT_THEME "tokyonight_night"

fish_config theme choose "TokyoNight Night"

# set up NEOVIM as a default editor.
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim

# Always use a block cursor
set -g fish_cursor_default block
set -g fish_cursor_insert block
set -g fish_cursor_replace block
set -g fish_cursor_visual block

# Open tmux as default when the shell starts
# Only attach if we're in an interactive session to avoid breaking scripts
if not set -q TMUX
  set -g TMUX tmux new-session -d -s mainline
  eval $TMUX
  tmux attach-session -d -t mainline
end

# keep as alias since it's the base ls command replacement
alias ls='eza -alg --color=always --icons --group-directories-first'
alias cat='bat --style=plain --paging=never'
alias rm='rm -I --preserve-root'
alias cp='cp -i'
alias mv='mv -i'
alias ln='ln -i'
alias chown='chown --preserve-root'
alias chmod='chmod --preserve-root'
alias chgrp='chgrp --preserve-root'

# some raw aliases
alias lsraw='command ls'
alias clearraw='command clear'

# colorize grep output (good for log files) - keep as global setting
alias grep='grep --color=auto'

bind \cd delete-char  # don't exit on accidental Ctrl-D
bind \cd\cd\cd delete-or-exit  # exit on the third one

# initialize zoxide only in interactive mode
if status is-interactive
    zoxide init fish | source
end

# toilet "shricodev" -F border -F rainbow -f pagga
