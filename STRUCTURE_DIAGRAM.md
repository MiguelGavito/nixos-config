#!/usr/bin/env bash
# Script to visualize the final nixos-config home structure after migration

cat << 'EOF'
╔══════════════════════════════════════════════════════════════════════════════╗
║                      NIXOS-CONFIG STRUCTURE - POST MIGRATION                 ║
╚══════════════════════════════════════════════════════════════════════════════╝

📁 home/
│
├── 📄 default.nix [UPDATED]
│   imports: ./base, ./linux, ./darwin
│
├── 📁 base/ [AGGREGATOR - NEW]
│   │
│   ├── 📄 default.nix [NEW]
│   │   imports: ./core, ./tui, ./gui
│   │
│   ├── 📁 core/ [Cross-platform essentials]
│   │   ├── 📄 default.nix [UPDATED - added ./common.nix]
│   │   ├── 📄 common.nix [NEW - 27 lines]
│   │   │   └─ CLI tools: zip, ripgrep, docker, kubectl, db-clients, misc
│   │   ├── 📄 btop.nix
│   │   ├── 📄 core.nix
│   │   ├── 📄 git.nix
│   │   ├── 📄 npm.nix
│   │   ├── 📄 pip.nix
│   │   ├── 📄 starship.nix
│   │   ├── 📄 theme.nix [Catppuccin theming]
│   │   ├── 📄 yazi.nix
│   │   ├── 📁 editors/
│   │   │   └── 📁 neovim/ [Full IDE config]
│   │   └── 📁 shells/
│   │       ├── 📄 default.nix [UPDATED - added ./common.nix]
│   │       ├── 📄 common.nix [NEW - 229 lines]
│   │       │   └─ Shell tools: direnv, zoxide, fzf, eza, bat, skim
│   │       ├── 📄 bash.nix
│   │       ├── 📄 zsh.nix
│   │       ├── 📄 aliases.nix
│   │       ├── 📄 env.nix
│   │       └── 📁 nushell/
│   │
│   ├── 📁 tui/ [Terminal UIs - no GUI needed]
│   │   ├── 📄 default.nix
│   │   │   imports: ./editors, ./tools, ./tmux.nix
│   │   ├── 📄 tmux.nix
│   │   ├── 📁 editors/
│   │   │   └── 📁 neovim/ [Full IDE]
│   │   └── 📁 tools/ [CREATED WITH DEFAULT.NIX]
│   │       ├── 📄 default.nix [NEW - scanPaths]
│   │       ├── 📄 networking.nix [NEW - 25 lines]
│   │       │   └─ SSH config, wget
│   │       └── (other tools as created)
│   │
│   └── 📁 gui/ [Cross-platform GUI apps]
│       ├── 📄 default.nix
│       ├── 📁 terminal/
│       │   ├── kitty.nix
│       │   └── 📁 alacritty/
│       ├── 📄 dev-tools.nix
│       └── 📄 media.nix
│
├── 📁 linux/ [Linux-specific]
│   ├── 📄 default.nix
│   │   imports: ./gui, ./tui (plus gui.nix, tui.nix for compatibility)
│   ├── 📄 gui.nix
│   ├── 📄 tui.nix
│   └── 📁 gui/
│       ├── 📄 default.nix [UPDATED - added ./hyprland]
│       │   imports: ./base, ./wayland, ./hyprland
│       │
│       ├── 📁 base/ [Linux desktop applications]
│       │   ├── 📄 default.nix [UPDATED - added ./editors.nix]
│       │   │   imports: browsers, gaming, media, productivity, creative, dev-tools, desktop-tools, editors, xdg
│       │   ├── 📄 browsers.nix [Chromium, Brave]
│       │   ├── 📄 gaming.nix [bottles, heroic, lutris]
│       │   ├── 📄 media.nix [obs, audacity, vlc, gimp, etc]
│       │   ├── 📄 productivity.nix [libreoffice, obsidian, calibre]
│       │   ├── 📄 creative.nix [inkscape, krita, musescore]
│       │   ├── 📄 dev-tools.nix [wireshark, dbeaver, insomnia]
│       │   ├── 📄 desktop-tools.nix [nautilus, discord, ferdium]
│       │   ├── 📄 editors.nix [NEW - VSCode migrated from home/ide/]
│       │   └── 📁 xdg/
│       │       ├── 📄 default.nix
│       │       └── 📄 mime.nix
│       │
│       ├── 📁 wayland/ [Wayland desktop components]
│       │   ├── 📄 default.nix [UPDATED - added ./env.nix import]
│       │   ├── 📄 env.nix [NEW - Wayland env vars]
│       │   ├── 📁 waybar/ [status bar config]
│       │   │   ├── config.jsonc
│       │   │   ├── style.css
│       │   │   └── 📁 scripts/
│       │   ├── 📁 mako/ [notification daemon config]
│       │   └── (systemd services for waybar, mako, swaybg, nm-applet)
│       │
│       └── 📁 hyprland/ [Hyprland window manager - MIGRATED]
│           ├── 📄 default.nix [NEW - module setup]
│           └── 📁 conf/
│               └── 📄 hyprland.conf [NEW - full config]
│
├── 📁 darwin/ [macOS - placeholder]
│   └── 📄 default.nix
│
├── 📁 desktop/ [Desktop environments - should eventually migrate]
│   ├── 📁 base/
│   ├── 📁 niri/ [Niri window manager - still used]
│   ├── 📁 hyprland/ [DEPRECATED - moved to linux/gui/hyprland/]
│   └── 📄 README.md
│
├── 📁 ide/ [DEPRECATED - VSCode moved to linux/gui/base/editors.nix]
│   ├── 📄 default.nix
│   ├── 📁 nvim/ [Duplicate of base/tui/editors/nvim - can consolidate]
│   └── 📄 vscode.nix [DEPRECATED - migrated]
│
├── 📁 programs/ [DEPRECATED - all moved to linux/gui/base/]
│   ├── browsers.nix [DEPRECATED]
│   ├── common.nix [DEPRECATED]
│   ├── gaming.nix [DEPRECATED]
│   └── ... [all files deprecated]
│
└── 📁 shell/ [DEPRECATED - consolidated into base/core/shells/]
    ├── 📄 common.nix [DEPRECATED]
    ├── 📄 bash.nix [DEPRECATED]
    ├── 📄 zsh.nix [DEPRECATED]
    └── ... [all files deprecated]

───────────────────────────────────────────────────────────────────────────────

📁 modules/ [System-level NixOS modules]
├── 📄 default.nix [now imports ./gaming.nix]
├── 📄 gaming.nix [NEW - system gaming support]
├── 📄 boot.nix
├── 📄 graphics.nix
└── ... [other system modules]

───────────────────────────────────────────────────────────────────────────────

📊 MIGRATION STATISTICS

✅ Files Created: 8
   - home/base/default.nix
   - home/base/core/common.nix
   - home/base/core/shells/common.nix
   - home/base/tui/tools/default.nix
   - home/base/tui/tools/networking.nix
   - home/linux/gui/base/editors.nix
   - home/linux/gui/hyprland/default.nix
   - home/linux/gui/hyprland/conf/hyprland.conf
   - home/linux/gui/wayland/env.nix (updated)

✅ Files Modified: 5
   - home/default.nix
   - home/base/core/default.nix
   - home/base/core/shells/default.nix
   - home/linux/gui/default.nix
   - home/linux/gui/wayland/default.nix
   - outputs/x86_64-linux/src/elnavio.nix

📋 Files to Deprecate (after testing):
   - home/programs/ (ALL - ~10 files)
   - home/shell/common.nix (consolidate)
   - home/ide/vscode.nix (migrated)
   - home/ide/nvim/ (duplicate - keep base/tui/editors/nvim/)
   - home/desktop/hyprland/ (migrated)

───────────────────────────────────────────────────────────────────────────────

🎯 RYAN4YIN PATTERN COMPLIANCE

✅ Cross-platform separation:
   - home/base/ contains portable configuration
   - home/linux/ contains linux-specific apps/config
   - home/darwin/ ready for macOS

✅ Logical grouping:
   - core: Essential cross-platform tools
   - tui: Terminal UIs without GUI requirements
   - gui: Graphical applications

✅ Wayland-first:
   - home/linux/gui/wayland/ with environment variables
   - home/linux/gui/hyprland/ with compositor config
   - home/desktop/niri/ for alternative compositor

✅ Shell tool integration:
   - All shell tools with enableBashIntegration
   - enableZshIntegration and enableNushellIntegration
   - Consolidated in home/base/core/shells/common.nix

✅ Dual-level gaming support:
   - System: modules/gaming.nix
   - User: home/linux/gui/base/gaming.nix

───────────────────────────────────────────────────────────────────────────────
EOF
