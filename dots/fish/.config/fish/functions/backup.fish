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
