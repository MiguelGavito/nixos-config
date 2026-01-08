# Nushell configuration
# Most config is managed by home-manager (aliases, integrations)
# This file is for nushell-specific settings only

# Starship prompt integration (home-manager manages this)
source ~/.cache/starship/init.nu

# Nushell-specific settings
$env.config = {
  show_banner: false
  edit_mode: vi
}

# Aliases are managed by home-manager via programs.nushell.shellAliases
# See home/shell/aliases.nix

