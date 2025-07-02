# Package Manager Path Configuration
# Centralized path management for various package managers

# Bun
if test -d "$HOME/.bun"
    set -gx BUN_INSTALL "$HOME/.bun"
    fish_add_path "$BUN_INSTALL/bin"
end

# pnpm
set -l pnpm_home "$HOME/.local/share/pnpm"
if test -d $pnpm_home
    set -gx PNPM_HOME $pnpm_home
    fish_add_path "$PNPM_HOME"
end