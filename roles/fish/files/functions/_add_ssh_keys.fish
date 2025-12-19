function _add_ssh_keys --description "Add SSH keys automatically"
    # Array of SSH keys to load (add your keys here)
    set ssh_keys \
        "$HOME/.ssh/gh_login_shricodev" \
        "$HOME/.ssh/homelab-vm_key.pem"

    for key in $ssh_keys
        if test -f $key
            ssh-add $key >/dev/null 2>&1
        end
    end
end
