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

> **Note:** Both Niri and GNOME are installed. Choose your desktop session at the GDM login screen (gear icon ⚙️).

## Window Managers

### Niri (Primary)

#### Basic Applications
- `Super + T` → Terminal (kitty)
- `Super + D` → Launcher (fuzzel)
- `Super + Alt + L` → Lock screen (swaylock)

#### Help & System
- `Super + Shift + /` → Show all keybindings overlay
- `Super + O` → Toggle overview mode

#### Window Management
- `Super + Q` → Close current window
- `Super + H/J/K/L` → Focus window (left/down/up/right)
- `Super + Arrow Keys` → Focus window (directional)
- `Super + Ctrl + H/J/K/L` → Move window
- `Super + Ctrl + Arrow Keys` → Move window (directional)
- `Super + Home/End` → Focus first/last column
- `Super + Ctrl + Home/End` → Move column to first/last position

#### Window Layout
- `Super + F` → Maximize column
- `Super + Shift + F` → Fullscreen window
- `Super + R` → Switch column width preset
- `Super + Shift + R` → Switch window height preset
- `Super + Ctrl + R` → Reset window height
- `Super + [` → Consume/expel window left
- `Super + ]` → Consume/expel window right
- `Super + ,` → Consume window into column
- `Super + .` → Expel window from column

#### Workspaces
- `Super + 1/2/3/4/5/6/7/8/9` → Switch to workspace
- `Super + Ctrl + 1/2/3/4/5/6/7/8/9` → Move column to workspace
- `Super + U/I` → Focus workspace down/up
- `Super + Page Down/Up` → Focus workspace down/up
- `Super + Ctrl + U/I` → Move column to workspace down/up
- `Super + Shift + U/I` → Move workspace down/up

#### Monitor Management
- `Super + Shift + H/J/K/L` → Focus monitor (directional)
- `Super + Shift + Arrow Keys` → Focus monitor (directional)

#### Multimedia (Function Keys)
- `XF86MonBrightnessUp/Down` → Brightness ±10%
- `XF86AudioRaiseVolume/LowerVolume` → Volume ±10%
- `XF86AudioMute` → Toggle mute
- `XF86AudioMicMute` → Toggle microphone mute
- `XF86AudioPlay/Stop/Next/Prev` → Media control

#### Mouse (with Scroll Wheel)
- `Super + Wheel Scroll Down/Up` → Focus workspace (cooldown: 150ms)
- `Super + Ctrl + Wheel Scroll` → Move column to workspace
- `Super + Wheel Scroll Left/Right` → Focus column
- `Super + Shift + Wheel Scroll` → Focus column (alternative)

---

### Hyprland

#### Basic Applications
- `Super + Return` → Terminal (kitty)
- `Super + Space` → Launcher (fuzzel)
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

#### Screenshots
- `Print` → Screenshot selected area (copy to clipboard)
- `Super + Shift + S` → Screenshot to ~/Pictures/Screenshots/

#### Multimedia (Function Keys + Fallbacks)
- `XF86MonBrightnessUp/Down` or `Super + Shift + =/−` → Brightness ±5%
- `XF86AudioRaiseVolume/LowerVolume` or `Super + Alt + =/−` → Volume ±5%
- `XF86AudioMute` → Toggle mute

#### Mouse
- `Super + Left Click` → Move window
- `Super + Right Click` → Resize window

---

## Input Configuration

### Keyboard Layouts
Both window managers support multiple keyboard layouts:
- **US** (default)
- **Spanish** (es)
- **Japanese** (jp)

**Switch layouts:** `Alt + Shift`

### Touchpad
- **Natural scroll** enabled
- **Tap-to-click** enabled (Niri only)

---

## Important Notes

- **Super** = Windows/Command key (also called "Mod" key)
- **Primary Desktop:** Niri (with custom configs)
- **Backup Desktop:** GNOME (system defaults, no custom home-manager configs)
- Niri uses **fuzzel** as the application launcher
- Hyprland also uses **fuzzel** for consistency
- Kitty is the default terminal (fast with GPU acceleration)
- All media keys (brightness, volume, playback) work on both WMs
- Niri's keybinding overlay (`Super + Shift + /`) shows all shortcuts dynamically
