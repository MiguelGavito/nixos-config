# 📌 Quick Checklist - Lanave Setup Tasks

## FIRST: Choose Your Configuration Level

**What type of machine is this?**

- [ ] **Minimal Server** → Import only `home/base/core` (shells, git, basic tools)
- [ ] **Dev SSH Machine** → Import `home/base/core` + `home/base/tui` (+ neovim, tmux)
- [ ] **Linux Desktop (Wayland)** → Import `home/base` + `home/linux/gui/wayland` + `home/desktop/niri` ← **YOU ARE HERE**
- [ ] **Linux Desktop (Hyprland)** → Import `home/base` + `home/linux/gui/hyprland`
- [ ] **macOS Machine** → Import `home/base` + `home/darwin`

**Why?** Each level imports from previous levels, so you only get what you need. See HOW_TO_MODIFY.md for details.

---

## Pre-Application (DO THIS FIRST)
- [ ] **Read [FILES_THAT_CHANGE.md](FILES_THAT_CHANGE.md)** - see exactly what gets modified
- [ ] Back up current configs: `home-manager switch -b backup --flake .#lanave`
- [ ] Review each decision in LANAVE_CONFIG.md
- [ ] Choose your keyboard layout
- [ ] Choose your theme/colors

## Core Decisions
- [ ] **Keyboard**: _______
- [ ] **Theme**: _______
- [ ] **Shell Primary**: zsh _(default)_ or change?
- [ ] **Desktop Compositor**: Niri _(default)_ or Hyprland?
- [ ] **Terminal Emulator**: Alacritty _(default)_ or Kitty?

## Dev Environment
- [ ] **Language Support**: Python? Node? Rust? Go?
- [ ] **Database Tools**: PostgreSQL? MySQL? MongoDB?
- [ ] **Docker/Kubernetes**: Yes or No?
- [ ] **LSPs/Formatters**: Which ones?

## System & Utilities
- [ ] **Need Clipboard Manager?** (cliphist, wl-clip-persist)
- [ ] **Need Password Manager?** (1password, bitwarden, pass)
- [ ] **Need VPN?** (protonvpn, wireguard)
- [ ] **Need Virtualization?** (QEMU/KVM, VirtualBox)

## Gaming (Optional)
- [ ] **Steam**: Yes or No?
- [ ] **Proton/Wine**: Yes or No?
- [ ] **GPU Drivers**: AMD / NVIDIA / Intel?

## After Successful Build
- [ ] Test all aliases (`hmsw`, `nixflk`, etc)
- [ ] Launch Niri and test keybinds
- [ ] Verify all shells work (bash, zsh, nushell)
- [ ] Check git config is correct
- [ ] Test Waybar/Mako appear

---

## Resources
- Niri config: `home/desktop/niri/conf/config.kdl`
- Waybar config: `home/linux/gui/wayland/` (look for waybar.nix if exists)
- Shell aliases: `home/base/core/shells/aliases.nix`
- Available modules: `modules/` directory

