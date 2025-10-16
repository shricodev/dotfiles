# FZF Configuration
# Optimized FZF settings for better performance and usability

# Basic FZF options - layout=reverse makes the prompt at the top
set -gx FZF_DEFAULT_OPTS "--height=65% --layout=reverse --bind ctrl-u:preview-page-up,ctrl-d:preview-page-down"

# Default command for file listing - uses fd for better performance
set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"

# Preview options for CTRL-T (file search)
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always --style=numbers --line-range=:500 {}' --preview-window=right:noborder"

# Preview options for ALT-C (directory search)
set -gx FZF_ALT_C_OPTS "--preview 'eza --tree --icons --color=always {} | head -n 200' --preview-window=right:noborder"
