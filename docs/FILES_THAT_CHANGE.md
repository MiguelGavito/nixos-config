# 📝 What Gets Changed: File-by-File Breakdown

When you run `home-manager switch --flake .#lanave`, these 4 files will be rewritten:

---

## 1️⃣ `~/.bash_profile`

**Generated from**: `home/base/core/shells/bash.nix` (profileExtra)

```bash
# Load nix profile if it exists (for standalone home-manager)
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi
```

**What it does**:
- Loads Nix environment on Arch (important for standalone home-manager)
- Runs once when bash starts as login shell

**Impact**: ✅ Safe - just loads nix, no breaking changes

---

## 2️⃣ `~/.bashrc`

**Generated from**: `home/base/core/shells/bash.nix` (bashrcExtra)

```bash
# User-installed binaries - add only if not already in PATH
for dir in "$HOME/.local/bin" "$HOME/go/bin" "$HOME/.cargo/bin" "$HOME/.npm/bin"; do
  [[ ":$PATH:" == *":$dir:"* ]] || export PATH="$PATH:$dir"
done

# Ensure session variables are available in SSH
export EDITOR="${EDITOR:-nvim}"
export VISUAL="${VISUAL:-nvim}"
export BROWSER="${BROWSER:-brave}"

# Fallback prompt if starship fails (non-interactive SSH case)
if [[ -z "$PS1" ]]; then
  export PS1='\u@\h:\W\$ '
fi
```

**What it does**:
- Adds to PATH: `~/.local/bin`, `~/go/bin`, `~/.cargo/bin`, `~/.npm/bin`
- Sets default editor/visual/browser to nvim/brave
- Provides fallback prompt for SSH sessions

**Impact**: ⚠️ Changes how bash behaves
- If you had custom `~/.bashrc`, it gets **replaced** (not appended)
- The backup will be at `~/.bashrc.backup` (if you use `-b backup`)
- ✅ Backup first!

---

## 3️⃣ `~/.zshrc`

**Generated from**: `home/base/core/shells/zsh.nix`

The generated file will include:

```zsh
# Oh-my-zsh initialization
export ZSH=<nix-store-path>/oh-my-zsh

# Plugins
plugins=(git)

# Theme
ZSH_THEME="agnoster"

# History settings
HISTFILE=~/.cache/zsh/history
HISTSIZE=10000
SAVEHIST=10000

# Load nix profile
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then
  . $HOME/.nix-profile/etc/profile.d/nix.sh
fi

# Interactive-only guard
if [[ -o interactive ]]; then
  :
fi

# Plus: all aliases from home/base/core/shells/aliases.nix
alias k="kubectl"
alias ll="eza -la --icons --git"
alias la="eza -a --icons"
alias nixc="cd ~/nixos-config"
alias ".."="cd .."
alias "..."="cd ../.."
alias nixflk="nix flake check"
alias hmsw="home-manager switch --flake .#\$(hostname)"
alias darwinsw="darwin-rebuild switch --flake .#\$(hostname)"
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gp="git push"
```

**What it does**:
- Uses Oh-my-zsh theme "agnoster" (fancy prompt with git status)
- Enables git plugin
- History stored in `~/.cache/zsh/history` (XDG-compliant)
- Loads all the aliases (kubectl, eza, nix commands, git shortcuts)

**Impact**: ⚠️ **Major change if you have custom .zshrc**
- Your current config gets **completely replaced**
- Oh-my-zsh is installed from nixpkgs (managed)
- ✅ Backup first!

---

## 4️⃣ `~/.config/alacritty/alacritty.toml`

**Generated from**: `home/base/gui/terminal/alacritty/default.nix` (settings)

```toml
[window]
opacity = 0.93
startup_mode = "Maximized"
dynamic_title = true
option_as_alt = "Both"
decorations = "None"

[scrolling]
history = 10000

[font]
size = 13

[font.normal]
family = "Maple Mono NF CN"

[font.bold]
family = "Maple Mono NF CN"

[font.italic]
family = "Maple Mono NF CN"

[font.bold_italic]
family = "Maple Mono NF CN"

[terminal]
osc52 = "CopyPaste"

[terminal.shell]
program = "/nix/store/xxx-bash-5.x/bin/bash"
args = ["--login", "-c", "nu --login --interactive"]
```

**What it does**:
- Terminal starts **maximized** with 93% opacity
- Font: **Maple Mono NF CN** at size 13
- Default shell: bash → nushell (interactive)
- Scrollback history: 10,000 lines
- Clipboard support via OSC 52

**Impact**: ✅ Safe replacement
- Just cosmetic + shell changes
- Font needs to be installed (you have it: `noto-fonts-cjk-sans`)
- If font missing → falls back to default

---

## 📊 Summary of Changes

| File | Type | Severity | Backup? |
|------|------|----------|---------|
| `.bash_profile` | Shell config | 🟡 Minor | Yes |
| `.bashrc` | Shell config | 🔴 Major | **Yes** |
| `.zshrc` | Shell config | 🔴 Major | **Yes** |
| `.config/alacritty/alacritty.toml` | App config | 🟡 Minor | Yes |

---

## ⚠️ Before You Apply

1. **Backup everything**:
   ```bash
   home-manager switch -b backup --flake .#lanave
   ```
   This creates `.bash_profile.backup`, `.bashrc.backup`, etc.

2. **Check what you're losing**:
   ```bash
   cat ~/.bashrc  # Save if you have custom content
   cat ~/.zshrc   # Save if you have custom content
   ```

3. **After applying, verify**:
   ```bash
   # Check shell works
   bash --version
   zsh --version
   
   # Check aliases work
   hmsw  # Should be recognized
   ll    # Should list files with eza
   
   # Check alacritty
   alacritty  # Should start maximized
   ```

---

## 🔄 If Something Breaks

```bash
# Restore from backup
mv ~/.bashrc.backup ~/.bashrc
mv ~/.zshrc.backup ~/.zshrc
mv ~/.bash_profile.backup ~/.bash_profile
mv ~/.config/alacritty/alacritty.toml.backup ~/.config/alacritty/alacritty.toml

# Or go back to previous generation
home-manager switch --flake .#lanave --switch-generation N
```

