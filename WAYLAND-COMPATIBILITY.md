# Wayland Compatibility - What Works and What Doesn't

## Programs That Don't Work Well on Wayland (Especially Niri)

### 1. **Steam** (Your Current Problem)
**Why it breaks:**
- Uses Chromium Embedded Framework (CEF) for UI
- CEF expects X11 compositing and GPU layers
- NVIDIA hybrid laptops have double trouble (NVIDIA + Wayland = broken CEF)
- Black screen, missing textures, can't see store/library

**Solutions:**
- ❌ We tried: Software rendering, GPU disable, X11 forcing - all failed
- ✅ **What actually works:**
  - **Option A:** Use Flatpak Steam (has better Wayland isolation)
  - **Option B:** Switch to X11-based DE when using Steam
  - **Option C:** Use `steam -bigpicture` (different rendering path)
  - **Option D:** Accept broken UI, launch games from Library (works blind)

### 2. **Electron Apps** (Discord, VSCode, Slack, etc.)
**Why they break:**
- Like CEF, use Chromium rendering
- Need special flags: `--enable-features=UseOzonePlatform --ozone-platform=wayland`
- Without flags: blurry, broken menus, input issues

**Your apps:**
- **Discord** - Should work with flags
- **VSCode** - Usually works but may have issues
- Need to check if your configs include Wayland flags

### 3. **Screen Sharing**
**Why it breaks:**
- X11 apps expect `XSHM` extension
- Wayland uses portals (xdg-desktop-portal)
- Many apps don't support portal API

**Your setup:**
- ✅ You have `xdg-desktop-portal-gtk` enabled
- ⚠️ May need `xdg-desktop-portal-wlr` for screenshare in OBS/Discord

### 4. **Java/Swing Apps**
**Why they break:**
- Java AWT assumes X11
- Need `_JAVA_AWT_WM_NONREPARENTING=1` environment variable
- Still buggy on tiling WMs like Niri

### 5. **Wine/Proton Games (via Lutris, Heroic)**
**Why they break:**
- Windows apps expect X11
- Wayland adds translation overhead
- Input lag, broken fullscreen

**Your setup:**
- You have Lutris, Heroic, Bottles
- Should mostly work via XWayland but performance loss

### 6. **Clipboard Managers**
**Why they break:**
- X11 clipboard is global
- Wayland clipboard is per-app
- Need `wl-clipboard` (you have it) but apps must support it

### 7. **Global Hotkeys**
**Why they break:**
- Wayland security: apps can't grab global keys
- Only compositor can set global hotkeys
- Apps like KeePassXC autotype won't work

## What DOES Work on Wayland

✅ **Native Wayland apps:**
- Firefox (with `MOZ_ENABLE_WAYLAND=1`)
- Brave/Chrome (with Ozone flags)
- Kitty, Alacritty (terminals)
- MPV, VLC (video)
- GIMP, Inkscape (graphics)
- Most GTK4/Qt6 apps

✅ **Via XWayland (transparently):**
- Most X11 apps run fine
- Some performance overhead
- You have `xwayland-satellite` for Niri

## Your Specific Situation

**Hardware:** Hybrid NVIDIA laptop (AMD iGPU + NVIDIA dGPU)  
**WM:** Niri (pure Wayland, no X11 fallback)  
**Problem:** Steam UI completely broken

### Your Options

#### Option 1: Keep Wayland, Work Around Steam
```nix
# Use Flatpak Steam (better Wayland isolation)
environment.systemPackages = [ pkgs.flatpak ];
# Then: flatpak install flathub com.valvesoftware.Steam
```

#### Option 2: Keep Wayland, Use Steam Big Picture
```bash
# Launch games from Big Picture mode (works better)
steam -bigpicture
```

#### Option 3: Dual Boot - Use Hyprland/X11 for Gaming
- Keep Niri for work/productivity
- Switch to GNOME (X11 session) or Hyprland for gaming
- You already have Hyprland configured

#### Option 4: Accept Broken UI
- Navigate Steam library blind
- Games launch fine once you find them
- Use keyboard shortcuts (`Shift+Tab` overlay works)

#### Option 5: Switch to X11 Entirely
- Use GNOME X11 session or i3/Sway
- Everything works, but lose Niri benefits

## My Recommendation

**For your use case (keyboard-first, clean, efficient):**

1. **Keep Niri for daily use** (work, browsing, dev)
2. **Install Flatpak Steam** for gaming sessions
3. **Or switch to Hyprland when gaming** (you have it configured)

**Quick command to switch:**
```bash
# In your host config, toggle:
desktops.niri.enable = false;
desktops.hyprland.enable = true;
# Rebuild, reboot, game, switch back
```

## What Do You Want to Do?

**A.** Keep fighting Steam on Niri (more debugging, low success chance)  
**B.** Use Flatpak Steam (5 min setup, likely works)  
**C.** Dual-boot between Niri and Hyprland (best of both worlds)  
**D.** Accept broken Steam UI and launch games blind  
**E.** Abandon Wayland for now, use X11 DE

Tell me which option and I'll implement it properly.
