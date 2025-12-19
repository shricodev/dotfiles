# SSH Configuration
# Automated SSH agent setup and key management

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
