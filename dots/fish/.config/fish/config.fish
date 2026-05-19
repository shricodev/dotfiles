# My fish config. Not much to see here; just some pretty standard stuff.

fish_add_path \
    "$HOME/.bin" \
    "$HOME/.local/bin" \
    "$HOME/local/bin" \
    "/var/lib/flatpak/exports/bin" \
    "$HOME/go/bin" \
    "$HOME/.fzf/bin"

# Suppress fish's intro message
set fish_greeting

# NOTE: don't set the terminal color like this here. as fish makes it universal
# even inside tmux. setting xterm-256color here will override the tmux color
# settings as well. Just use the terminal emulator default here.
# set TERM xterm-256color

# if status is-interactive
#   theme_gruvbox dark medium
# end

# set up NEOVIM as a default editor.
set -gx EDITOR nvim
set -gx GIT_EDITOR nvim

# Blinking block cursor
set -g fish_cursor_default block blink
set -g fish_cursor_insert block blink
set -g fish_cursor_replace block blink
set -g fish_cursor_visual block blink

# Open tmux as default when the shell starts
# Only attach if we're in an interactive session to avoid breaking scripts
if status is-interactive; and not set -q TMUX
    exec ~/.local/bin/tmux-start
end

if status is-interactive
    set -l cache_dir ~/.cache/fish
    mkdir -p $cache_dir

    # Cache init scripts. only regenerate when the binary changes
    set -l starship_cache $cache_dir/starship.fish
    if not test -f $starship_cache; or test (command -v starship) -nt $starship_cache
        starship init fish > $starship_cache
    end
    source $starship_cache

    set -l zoxide_cache $cache_dir/zoxide.fish
    if not test -f $zoxide_cache; or test (command -v zoxide) -nt $zoxide_cache
        zoxide init fish > $zoxide_cache
    end
    source $zoxide_cache

    set -l mise_cache $cache_dir/mise.fish
    if not test -f $mise_cache; or test ~/.local/bin/mise -nt $mise_cache
        ~/.local/bin/mise activate fish > $mise_cache
    end
    source $mise_cache
end
