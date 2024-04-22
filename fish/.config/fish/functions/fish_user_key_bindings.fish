### SET EITHER DEFAULT EMACS MODE OR VI MODE ###
function fish_user_key_bindings
    # fish_default_key_bindings
    fish_vi_key_bindings
    # Use jk to change the mode from insert to normal in the terminal
    bind -M insert -m default jk backward-char force-repaint
    fzf --fish | source
end
