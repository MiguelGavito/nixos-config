# Desktop Configuration Structure


## Structure

```
home/desktop/
├── base/              # shared components
│   ├── waybar/
│   │   ├── config.jsonc
│   │   └── style.css
│   └── default.nix   # Install packages and shared services
├── hyprland/
│   ├── conf/
│   │   └── hyprland.conf  # Configuration of Hyprland
│   └── default.nix        
├── niri/
│   ├── conf/
│   │   └── config.kdl     # Config Niri
│   └── default.nix        # Import base 
└── default.nix            
```



