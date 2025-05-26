# Function for creating a backup file/dir
# ex: backup file.txt
# result: copies file as file.txt.bak
function backup --argument filename
    if test -f $filename
      cp $filename $filename.bak
    else if test -d $filename
      cp -r $filename $filename.bak
    end
end
