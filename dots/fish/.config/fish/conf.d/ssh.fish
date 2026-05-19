# Use a fixed socket path under XDG_RUNTIME_DIR. works on any DE or WM.
set -gx SSH_AUTH_SOCK "$XDG_RUNTIME_DIR/ssh-agent.socket"

if status is-interactive
    ssh-add -l >/dev/null 2>&1
    switch $status
        case 2
            # Agent unreachable. remove stale socket and start fresh
            rm -f $SSH_AUTH_SOCK
            ssh-agent -a $SSH_AUTH_SOCK >/dev/null
            _add_ssh_keys
        case 1
            # Agent running but empty. just load keys
            _add_ssh_keys
    end
end
