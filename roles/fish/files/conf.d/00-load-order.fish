# Load order configuration for Fish shell
# This file ensures proper loading sequence of functions

# Load critical functions first
for file in $__fish_config_dir/functions/load_first/*.fish
    if test -f $file
        source $file
    end
end

# Load utility functions last (after everything else is initialized)
for file in $__fish_config_dir/functions/load_last/*.fish
    if test -f $file
        source $file
    end
end
