# Steam Troubleshooting on Niri/Wayland

## Current Problem
- Images not loading correctly
- Can't search for games
- UI rendering broken

## Root Cause
Steam uses Chromium Embedded Framework (CEF) for its UI, which doesn't work well on pure Wayland compositors like Niri.

## Test These Solutions in Order

### 1. Console Mode (Current Config)
```bash
steam -console
```
- Uses simpler UI without heavy CEF rendering
- Should show library and allow launching games
- Try this first after rebuild

### 2. Force XWayland via Environment
```bash
WAYLAND_DISPLAY="" steam
```
- Forces Steam to use X11 instead of Wayland
- Most reliable for compatibility

### 3. Big Picture Mode
```bash
steam -bigpicture
```
- Controller-optimized UI
- Uses different rendering path
- Better Wayland support

### 4. Gamescope Wrapper (Best for Gaming)
```bash
gamescope -e -f -- steam
```
- Runs Steam in Valve's gaming compositor
- Full hardware acceleration
- Best for actual gaming

### 5. Disable All CEF Features
```bash
steam -no-cef-sandbox -disable-gpu -disable-software-rasterizer -no-browser
```
- Nuclear option: disables web views
- Minimal UI only

### 6. Check XWayland Satellite
```bash
# Verify xwayland-satellite is running
ps aux | grep xwayland-satellite

# If not running, start it
xwayland-satellite &
```

## Permanent Fix Options

### Option A: Use Flatpak Steam (Recommended)
```bash
# Install flatpak Steam (better Wayland support)
flatpak install flathub com.valvesoftware.Steam
flatpak run com.valvesoftware.Steam
```

### Option B: Always Use Gamescope
Edit your desktop entry to wrap with gamescope

### Option C: Use Steam Deck UI
```bash
steamos-session-select plasma-wayland-persistent
```

## Manual Test Commands
Run these from terminal to see which works:

```bash
# Test 1: Pure X11
env GDK_BACKEND=x11 QT_QPA_PLATFORM=xcb WAYLAND_DISPLAY="" steam

# Test 2: Console mode
steam -console

# Test 3: Gamescope
gamescope -w 1920 -h 1080 -f -- steam

# Test 4: Big Picture
steam -bigpicture

# Test 5: Check for errors
steam 2>&1 | grep -i "cef\|wayland\|error"
```

## After Testing
Tell me which command works and I'll configure that as your permanent launcher.
