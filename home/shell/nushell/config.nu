# Nushell configuration
# Most config is managed by home-manager (aliases, integrations)
# This file is for nushell-specific settings only

# Starship prompt integration (home-manager manages this)
# Use XDG_CACHE_HOME instead of hard-coded ~/.cache for portability
let starship_init = ($env.XDG_CACHE_HOME + "/starship/init.nu")
if ($starship_init | path exists) {
  source $starship_init
} else {
  print "⚠️  Warning: starship init.nu not found at: $starship_init"
  print "   Run: home-manager switch to regenerate"
}

# Nushell-specific settings
$env.config = {
  show_banner: false
  edit_mode: vi
}

# Aliases are managed by home-manager via programs.nushell.shellAliases
# See home/shell/aliases.nix

