# 🛠️ How to Modify Configurations

This file contains examples of how to change common settings in lanave.

---

## Understanding the Modular Structure

Before modifying, understand what you're importing:

| Import Path | Contents | Size | Use Case |
|-------------|----------|------|----------|
| `home/base/core/` | Shells, git, npm/pip, starship | 🟢 Tiny | Servers, minimal setups |
| `home/base/tui/` | + Neovim, tmux, tools | 🟡 Small | Dev machines (SSH) |
| `home/base/gui/` | + Alacritty, VSCode, media | 🟠 Medium | Desktop (all OS) |
| `home/linux/gui/wayland/` | + Waybar, Mako, Swaybg | 🟠 Medium | Linux Wayland desktops |
| `home/darwin/` | macOS-specific configs | 🟠 Medium | macOS machines |
| `home/desktop/niri/` | Niri compositor + keybinds | 🟡 Small | Linux with Niri |

### Example: Creating Different Levels

**Minimal server setup:**
```nix
# outputs/x86_64-linux/src/minimal-server.nix
imports = [
  home/base/core  # ← ONLY this
];
```

**Dev machine (SSH, no GUI):**
```nix
imports = [
  home/base/core
  home/base/tui  # ← Add CLI apps
];
```

**Full desktop (Arch, Niri):**
```nix
imports = [
  home/base
  home/linux/gui/wayland
  home/desktop/niri
];
```

**macOS machine:**
```nix
imports = [
  home/base  # ← Cross-platform GUI
  home/darwin  # ← Mac-specific configs
];
```

---

## 1. Add/Remove Programs

**File**: `home/base/core/` or `home/linux/gui/`

### Example: Add `fzf` (fuzzy finder)
Edit `home/base/core/default.nix` or create a new module:

```nix
home.packages = with pkgs; [
  fzf
  fd  # faster find
  ripgrep  # faster grep
];
```

### Example: Add Development Tools
Create `home/base/core/dev-tools.nix`:

```nix
{ pkgs, ... }: {
  home.packages = with pkgs; [
    # Rust
    rustup
    cargo-watch
    
    # Go
    go
    gotools
    
    # Python
    python3
    poetry
    
    # Node
    nodejs
    pnpm
  ];
}
```

Then add to imports in `home/base/core/default.nix`.

---

## 2. Change Shell Theme/Prompt

### Option A: Use Starship (Modern)
Edit `home/base/core/starship.nix` to customize.

### Option B: Change Oh-my-zsh Theme
Edit `home/base/core/shells/zsh.nix`:

```nix
programs.zsh = {
  oh-my-zsh = {
    enable = true;
    theme = "powerlevel10k";  # Change from "agnoster"
    plugins = [
      "git"
      "colored-man-pages"
      "command-not-found"
    ];
  };
};
```

---

## 3. Customize Alacritty (Terminal)

**File**: `home/base/gui/terminal/alacritty/default.nix`

### Change Font
```nix
font = {
  normal = {
    family = "JetBrains Mono";  # Change font
  };
  size = 14;  # Change size
};
```

### Change Colors
```nix
colors = {
  primary = {
    background = "#1e1e2e";
    foreground = "#cdd6f4";
  };
  # Add more color definitions...
};
```

---

## 4. Add Custom Aliases

**File**: `home/base/core/shells/aliases.nix`

```nix
shellAliases = {
  # Existing...
  k = "kubectl";
  
  # Add your own
  myproject = "cd ~/my-project";
  deploy = "nixos-rebuild switch --flake .#$(hostname)";
  syncnix = "cd ~/nixos-config && git pull && hmsw";
};
```

---

## 5. Customize Waybar

**Location**: Usually in `home/linux/gui/wayland/` or check imports

### Look for waybar config (might be JSON or Nix)

If it exists, you can customize:
- Position: top, bottom, left, right
- Modules: clock, battery, network, temperature, etc
- Styling: colors, fonts, layout

---

## 6. Customize Niri Keybinds

**File**: `home/desktop/niri/conf/config.kdl`

### Example: Add custom keybind
```kdl
binds {
    Super+Return { spawn "alacritty"; }
    Super+D { spawn "fuzzel"; }
    Super+N { spawn "nautilus"; }
}
```

---

## 7. Add Global Environment Variables

**File**: `home/base/core/shells/env.nix`

```nix
home.sessionVariables = {
  EDITOR = "nvim";
  VISUAL = "nvim";
  BROWSER = "brave";
  
  # Add custom ones
  MY_PROJECT_PATH = "/home/mariolo/projects";
  RUST_BACKTRACE = "1";
};
```

---

## 8. Enable Additional Wayland Tools

**File**: `home/linux/gui/wayland/default.nix`

Add packages in the `home.packages`:

```nix
home.packages = with pkgs; [
  # Existing...
  fuzzel
  waybar
  
  # Add custom
  imv  # image viewer
  mpv  # video player
  wf-recorder  # screen recording
];
```

---

## 9. Change Git Config

**File**: `hosts/lanave/home.nix`

```nix
programs.git.settings = {
  user.name = "Your Name";
  user.email = "your.email@example.com";
  
  # Add more git config
  pull.rebase = true;
  init.defaultBranch = "main";
};
```

---

## 10. Add SSH Configuration

**Create**: `home/base/core/ssh.nix`

```nix
{ config, ... }: {
  programs.ssh = {
    enable = true;
    
    matchBlocks = {
      "github.com" = {
        identityFile = "${config.home.homeDirectory}/.ssh/id_ed25519";
        user = "git";
      };
    };
  };
}
```

Then add to imports.

---

## 🔄 Workflow

1. **Edit** the .nix file
2. **Test**: `home-manager switch --flake .#lanave`
3. **If errors**: Check the error message, fix, retry
4. **If works**: Commit to git: `git add . && git commit -m "Update lanave config"`

---

## Useful Commands

```bash
# Apply changes
home-manager switch --flake .#lanave

# Check for errors without applying
home-manager build --flake .#lanave

# See what would change
home-manager build --flake .#lanave | less

# Roll back to previous generation
home-manager generations  # List
home-manager switch --flake .#lanave --switch-generation N  # Go to N

# Show Nix errors in detail
nix flake check

# Update flake inputs
nix flake update
```

