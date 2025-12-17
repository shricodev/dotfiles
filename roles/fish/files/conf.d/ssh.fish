# SSH Configuration
# Automated SSH agent setup and key management

# Function to add SSH keys automatically
function _add_ssh_keys
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

# Only setup SSH agent in interactive shells
if status is-interactive
    # Setup SSH agent if not already running
    if not set -q SSH_AUTH_SOCK
        eval (ssh-agent -c) >/dev/null 2>&1
    end

    # Add SSH keys if SSH agent is running
    if set -q SSH_AUTH_SOCK
        _add_ssh_keys
    end
end
