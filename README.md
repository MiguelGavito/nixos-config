# NixOS Configuration

This is not a tutorial or guide, but rather a learning configuration from a NixOS beginner. I do not recommend cloning or building this repository without knowledge of Nix. Do not use my host account configurations.

## Philosophy

This GitHub repository follows these core principles: **MODULARITY**, **PURPOSE**, **EXPANDABILITY**.

This repository is a personal learning project. It may contain errors, but the objective is to learn and solve them.

## Desktop Design and Workflow Rules

The workflow design follows these principles:
- Simple to use
- Minimalist
- Efficient

The main idea is to configure the entire system to work primarily with the keyboard. This requires more terminal usage, programs like Vim and Emacs, and similar tools.

---

# Keybindings

## Window Managers

### Niri

#### Basic Applications
- `Super + Enter` → Terminal (kitty)
- `Super + Space` → Launcher (wofi)
- `Super + Escape` → Lock screen (swaylock)

#### Window Management
- `Super + Q` → Close current window
- `Super + H/J/K/L` → Move focus (left/down/up/right)
- `Super + Shift + H/J/K/L` → Move window

#### Workspaces
- `Super + 1/2/3/4/5` → Switch to workspace
- `Super + Shift + 1/2/3/4/5` → Move window to workspace

#### System
- `Super + Shift + E` → Exit Niri
- `Super + Shift + R` → Restart Niri
- `Print` → Screenshot (selected area)

---

### Hyprland

#### Basic Applications
- `Super + Enter` → Terminal (kitty)
- `Super + Space` → Launcher (wofi)
- `Super + Escape` → Lock screen (swaylock)

#### Window Management
- `Super + Q` → Close current window
- `Super + F` → Fullscreen
- `Super + V` → Toggle floating
- `Super + H/J/K/L` → Move focus (left/down/up/right)
- `Super + Shift + H/J/K/L` → Move window

#### Workspaces
- `Super + 1/2/3/4/5` → Switch to workspace
- `Super + Shift + 1/2/3/4/5` → Move window to workspace

#### System
- `Super + M` → Exit Hyprland
- `Print` → Screenshot (selected area)

#### Multimedia (Function Keys)
- `XF86MonBrightnessUp/Down` → Brightness
- `XF86AudioRaiseVolume/LowerVolume` → Volume
- `XF86AudioMute` → Mute
- `XF86AudioPlay/Next/Prev` → Playback control

#### Mouse
- `Super + Left Click` → Move window
- `Super + Right Click` → Resize window

---

## Important Notes

- **Super** = Windows/Command key
- Keybindings are consistent between both WMs where possible
- Wofi opens with `Super + Space` to search and launch applications
- Kitty is the default terminal (fast with GPU acceleration)
