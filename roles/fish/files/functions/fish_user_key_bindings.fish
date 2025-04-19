function fish_user_key_bindings
    # fish_default_key_bindings
    fish_vi_key_bindings

    # #Use jk to change the mode from insert to normal in the terminal
    bind -M insert -m default jk backward-char force-repaint
    fzf --fish | source

    #Keep this change in the bottom after adding the fish_vi_key_bindings
    #Remove the /cd binding in fish, this basically kills tmux windows
    #runs the exit command
    bind --erase --preset \cd
    bind --mode default \cd delete-char
    bind --mode insert \cd delete-char
end
