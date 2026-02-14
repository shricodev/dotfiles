function lt --description "Tree listing with depth; uses tree or eza"
    set -l depth 1

    # Optional first arg: depth (e.g., lt 2 [path])
    if test (count $argv) -ge 1; and string match -qr '^[0-9]+$' -- $argv[1]
        set depth $argv[1]
        set -e argv[1]
    end

    # Optional path, default "."
    set -l path "."
    if test (count $argv) -ge 1
        set path $argv[1]
        set -e argv[1]
    end

    if type -q tree
        command tree -a -C --dirsfirst --gitignore -L $depth $path $argv
        return $status
    end

    if type -q eza
        command eza -aT --color=always --git-ignore --level=$depth --group-directories-first $path $argv
        return $status
    end

    echo "lt: required command not found: install 'tree' or 'eza'" >&2
    return 127
end

