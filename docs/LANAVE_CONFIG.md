# 🖥️ Lanave Configuration - Home Manager Setup

**Machine**: Arch Linux (en tu case)  
**User**: `mariolo`  
**Desktop**: Niri (compositor) + Waybar + Mako  
**Shell**: Zsh (with Oh-my-zsh) → Nushell (via Alacritty)

---

## 🏗️ Architecture: Why Separate Base/Linux/Darwin?

This is a **modular structure** so you can pick exactly what you need:

### The Layers (from minimal to full)

```
LEVEL 1: home/base/core/
├── Shells (bash, zsh, nushell basics)
├── Git, npm, pip, starship
├── Theme/colors
└── ✅ Works on: Linux, macOS, NixOS
└── 💡 Use for: Server/minimal setups

LEVEL 2: home/base/tui/ + LEVEL 1
├── Neovim, tmux, networking tools
├── Everything from core PLUS terminal UIs
└── ✅ Works on: Linux, macOS, NixOS
└── 💡 Use for: Dev machines (CLI-only or SSH)

LEVEL 3: home/base/gui/ + LEVEL 2
├── Alacritty, dev-tools (VSCode, etc), media players
├── Everything from tui PLUS GUI applications
└── ✅ Works on: Linux, macOS, NixOS
└── 💡 Use for: Desktop machines (cross-platform)

LEVEL 4A: home/linux/gui/wayland/ + LEVEL 3
├── Waybar, Mako, Swaybg (Wayland-specific)
└── ✅ Works on: Linux only
└── 💡 Use for: Linux desktops with Wayland

LEVEL 4B: home/darwin/ + (LEVEL 3 or custom)
├── macOS-specific configs
└── ✅ Works on: macOS only
└── 💡 Use for: Mac machines

LEVEL 5: home/desktop/niri/ + LEVEL 4A
├── Niri compositor config (KDL)
└── ✅ Works on: Linux with Wayland
└── 💡 Use for: Niri window manager
```

### Current Lanave Setup (Your Arch Machine)

```mermaid
lanave imports:
├── home/base/               ← LEVEL 3 (full GUI cross-platform)
│   ├── core/                → Git, shells, starship
│   ├── tui/                 → Neovim, tmux
│   └── gui/                 → Alacritty, terminals
├── home/linux/gui/wayland/  ← LEVEL 4A (Wayland tools)
│   └── Waybar, Mako, Swaybg
└── home/desktop/niri/       ← LEVEL 5 (Niri-specific)
    └── Niri config + keybinds
```

**Result**: Full desktop with Niri, Waybar, Mako, terminal GUI, dev tools

---

## ✅ What's Currently Enabled

| Component | Status | Location | Details |
|-----------|--------|----------|---------|
| **Niri Compositor** | ✅ | `home/desktop/niri/` | Window manager |
| **Waybar** | ✅ | `home/linux/gui/wayland/` | Status bar |
| **Mako** | ✅ | `home/linux/gui/wayland/` | Notifications |
| **Swaybg** | ✅ | `home/linux/gui/wayland/` | Wallpaper |
| **Zsh** | ✅ | `home/base/core/shells/` | Primary shell (with Oh-my-zsh) |
| **Git** | ✅ | `home/base/core/` | Version control |
| **Neovim** | ✅ | `home/base/tui/` | Text editor |
| **Tmux** | ✅ | `home/base/tui/` | Terminal multiplexer |
| **Alacritty** | ✅ | `home/base/gui/terminal/` | Terminal emulator (Maple Mono font) |
| **Starship** | ✅ | `home/base/core/` | Shell prompt |
| **NPM/Pip** | ✅ | `home/base/core/` | Package managers |
| **Yazi** | ✅ | `home/base/core/` | File manager |
| **Fonts** | ✅ | `hosts/lanave/home.nix` | CJK, Emoji, Noto, JetBrains Mono |
| **Git Git Config** | ✅ | `hosts/lanave/home.nix` | MiguelGavito / mgavitogzz@gmail.com |

---

## 🔧 Pre-configured Aliases (from `home/base/core/shells/aliases.nix`)

| Alias | Command | Use |
|-------|---------|-----|
| `k` | `kubectl` | Kubernetes |
| `ll` | `eza -la --icons --git` | Better ls |
| `la` | `eza -a --icons` | List all with icons |
| `nixc` | `cd ~/nixos-config` | Quick nav |
| `..`, `...` | `cd ..`, `cd ../..` | Navigation |
| `nixflk` | `nix flake check` | Check flake |
| `hmsw` | `home-manager switch --flake .#$(hostname)` | HM switch |
| `darwinsw` | `darwin-rebuild switch --flake .#$(hostname)` | Darwin |
| `gs`, `ga`, `gc`, `gp` | Git commands | Quick git |

---

## 📋 PENDIENTES & DECISIONES A TOMAR

### 1. **Keyboard Layout & Input**
- [ ] ¿Qué layout de teclado quieres? (US, ES, etc)
- [ ] ¿Necesitas soporte para múltiples idiomas?
- [ ] ¿Usar Mozc/Fcitx para IME? (ver `modules/mozc.nix`)

### 2. **Theme & Visual**
- [ ] ¿Qué tema visual? (Catppuccin, Noctalia, Dark, etc)
- [ ] Wallpaper preferido? (en `home/desktop/wallpapers/`)
- [ ] ¿Colores y fuentes finales?

### 3. **Terminal & Shell**
- [ ] ¿Mantener Oh-my-zsh o cambiar a Starship pure?
- [ ] ¿Plugins de zsh adicionales?
- [ ] ¿Terminal: Alacritty o Kitty?

### 4. **Development Tools**
- [ ] ¿Necesitas Docker?
- [ ] ¿Kubernetes tools (k9s, krew)?
- [ ] ¿Languages específicos? (Rust, Go, Python, Node, etc)
- [ ] ¿Database tools? (postgres, mysql, redis-cli)

### 5. **Wayland & Desktop**
- [ ] ¿Niri compositor está OK o quieres Hyprland?
- [ ] ¿Configuración de Waybar (posición, módulos)?
- [ ] ¿Keybindings en Niri? (revisar `home/desktop/niri/conf/config.kdl`)

### 6. **Media & Creative**
- [ ] ¿Necesitas GIMP, Krita, Blender?
- [ ] ¿Audio tools? (Audacity, Cpal, Hep, etc)
- [ ] ¿Video editing?

### 7. **Gaming** ⚠️
- [ ] ¿Juegos vía Steam, Proton?
- [ ] ¿Wine/Bottles?
- [ ] ¿GPU drivers? (NVIDIA vs AMD)

### 8. **Backup & System**
- [ ] ¿Necesitas rsync/duplicacy?
- [ ] ¿Monitoring tools? (htop, btop, etc) 
- [ ] ¿Snapshot strategy?

### 9. **Git & SSH**
- [ ] ¿SSH keys ya configuradas?
- [ ] ¿GitHub/GitLab access?
- [ ] ¿GPG signing for commits?

### 10. **Browser & Web**
- [ ] ¿Firefox, Brave, Chromium?
- [ ] ¿Extensions/Plugins?
- [ ] ¿Web development tools?

---

## 🚀 Next Steps

1. **Choose what to enable/disable** from the list above
2. **Edit configurations** in the modules:
   - `home/base/core/` → shells, editors, theme
   - `home/linux/gui/` → wayland, specific tools
   - `home/desktop/niri/` → Niri keybindings & layout
3. **Test locally** with `home-manager switch --flake .#lanave`
4. **Document** final choices here

---

## 📝 Decisions Made (Update this as you choose)

- [ ] Keyboard: ___________
- [ ] Theme: ___________
- [ ] Shell: ___________
- [ ] Desktop: ___________
- [ ] Dev Tools: ___________
- [ ] Extra packages: ___________

