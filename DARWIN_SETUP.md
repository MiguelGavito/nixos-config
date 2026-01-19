# MacBook Air M4 Configuration

## Información del Sistema

- **Modelo**: MacBook Air M4 (2024)
- **Arquitectura**: aarch64-darwin (Apple Silicon)
- **Host Name**: macbookair
- **Usuario**: miguel (cambiar en `outputs/aarch64-darwin/src/macbookair.nix`)

## Estructura

```
home/darwin/              # Configuración Home Manager para macOS
hosts/macbookair/         # Configuración específica del host
  └── home.nix            # Home Manager del host
outputs/aarch64-darwin/   # Outputs de Darwin
  ├── default.nix         # Exporta darwinConfigurations
  └── src/
      ├── default.nix     # Agrega todos los hosts
      └── macbookair.nix  # Configuración completa del sistema
```

## Instalación en macOS

### 1. Instalar Nix con soporte para flakes

```bash
# Instalar Nix (si no lo tienes)
curl --proto '=https' --tlsv1.2 -sSf -L https://install.determinate.systems/nix | sh -s -- install

# El instalador de Determinate Systems ya habilita flakes
```

### 2. Clonar el repositorio

```bash
git clone https://github.com/MiguelGavito/nixos-config.git ~/nixos-config
cd ~/nixos-config
```

### 3. Configurar tu usuario

Edita `outputs/aarch64-darwin/src/macbookair.nix` y cambia:
- `username = "miguel"` → tu nombre de usuario de macOS

### 4. Actualizar flake inputs

```bash
nix flake update
```

### 5. Construir la configuración (primera vez)

```bash
nix build .#darwinConfigurations.macbookair.system
```

### 6. Activar la configuración

```bash
# Primera vez (instala nix-darwin)
./result/sw/bin/darwin-rebuild switch --flake .#macbookair

# Después de la primera vez:
darwin-rebuild switch --flake .#macbookair
```

## Gestión del Sistema

### Actualizar el sistema

```bash
cd ~/nixos-config
nix flake update
darwin-rebuild switch --flake .#macbookair
```

### Ver cambios antes de aplicar

```bash
darwin-rebuild build --flake .#macbookair
nix store diff-closures /run/current-system ./result
```

### Rollback a una generación anterior

```bash
darwin-rebuild --list-generations
darwin-rebuild switch --rollback
```

## Homebrew

La configuración incluye soporte para Homebrew para apps que no están en nixpkgs.

Edita `outputs/aarch64-darwin/src/macbookair.nix` sección `homebrew`:

```nix
homebrew = {
  enable = true;
  
  brews = [
    # Añadir CLI tools
  ];
  
  casks = [
    "rectangle"  # Window manager
    "raycast"    # Spotlight replacement
  ];
  
  masApps = {
    # Mac App Store apps por ID
    "Xcode" = 497799835;
  };
};
```

## Configuración Incluida

### Base (home/base/)
- ✅ Shells: bash, zsh, nushell con tool integrations
- ✅ Neovim: Full IDE config
- ✅ Git: Configuración completa
- ✅ CLI tools: ripgrep, fzf, zoxide, eza, bat, etc
- ✅ Tmux: Terminal multiplexer
- ✅ Catppuccin theme

### GUI (home/base/gui/)
- ✅ Kitty terminal
- ✅ Alacritty terminal
- ✅ Dev tools cross-platform

### macOS System Defaults
- Dock autohide
- Dark mode
- Finder: show extensions
- Keyboard: fast key repeat
- Trackpad: disable natural scrolling

## Personalización

### Añadir paquetes

En `hosts/macbookair/home.nix`:
```nix
home.packages = with pkgs; [
  # Tus paquetes
  tree
  htop
];
```

### Modificar system defaults

En `outputs/aarch64-darwin/src/macbookair.nix`:
```nix
system.defaults = {
  dock = {
    # Tus preferencias
  };
};
```

## Troubleshooting

### Error: "user does not have permission"
```bash
# Dar permisos a tu usuario
sudo dscl . append /Groups/nixbld GroupMembership $(whoami)
```

### Homebrew no funciona
```bash
# Instalar Homebrew si no existe
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
```

### Rollback rápido
```bash
darwin-rebuild switch --rollback
```

## Referencias

- [nix-darwin Documentation](https://github.com/LnL7/nix-darwin)
- [Home Manager Manual](https://nix-community.github.io/home-manager/)
- [Ryan4Yin's Nix Config](https://github.com/ryan4yin/nix-config)
