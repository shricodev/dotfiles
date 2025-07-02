# Utility functions that can be loaded last
# These are convenience functions used infrequently

function backup --argument filename --description "Create a backup copy of a file or directory"
    if test -f $filename
        cp $filename $filename.bak
        echo "Created backup: $filename.bak"
    else if test -d $filename
        cp -r $filename $filename.bak
        echo "Created backup directory: $filename.bak"
    else
        echo "Error: $filename not found"
        return 1
    end
end

function skip --argument n --description "Skip the first N lines of input"
    if test -z "$n"
        echo "Usage: skip <number_of_lines>"
        return 1
    end
    tail +(math 1 + $n)
end

function mcdir --argument argv --description "Create a directory and cd into it"
    if test (count $argv) -eq 0
        echo "Usage: mcdir <directory>"
        return 1
    end
    mkdir -p $argv && cd $argv
end

