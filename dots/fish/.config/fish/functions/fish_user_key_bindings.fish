function fish_user_key_bindings
    # Only set up key bindings in interactive shells
    if not status is-interactive
        return
    end

    # fish_default_key_bindings
    fish_vi_key_bindings

    # #Use jk to change the mode from insert to normal in the terminal
    bind -M insert -m default jk backward-char force-repaint
    fzf --fish | source

    # Keep this change in the bottom after adding the fish_vi_key_bindings
    # Remove the Ctrl-D binding in fish - prevent accidental exits in tmux
    bind --erase --preset \cd
    bind --mode default \cd delete-char
    bind --mode insert \cd delete-char
    # Triple Ctrl-D to exit
    bind --mode default \cd\cd\cd delete-or-exit
    bind --mode insert \cd\cd\cd delete-or-exit
end
