# 🚀 NixOS Configuration

Configuración modular de NixOS con perfiles pre-configurados, Neovim mejorado, y soporte para múltiples entornos de escritorio.

## ✨ Características

- 📦 **Estructura modular** - Fácil de mantener y personalizar
- 🎯 **Múltiples perfiles** - Work, Gaming, Personal, Hybrid, Minimal
- 🖥️ **Dos escritorios** - KDE Plasma 6 y Hyprland
- ⌨️ **Neovim configurado** - LSP, Telescope, Treesitter, y más
- 🌍 **Teclado ES/EN** - Cambia con Alt+Shift
- 📱 **KDE Connect** - Sincronización con móvil
- 🎮 **Gaming optimizado** - Steam, GameMode, MangoHUD
- 🔧 **Desarrollo** - Docker, VSCode, Git, múltiples LSPs

## 📁 Estructura del Proyecto

```
.
├── configuration.nix          # Configuración principal
├── flake.nix                  # Configuración de flakes
├── hardware-configuration.nix # Hardware (auto-generado)
├── home.nix                   # Home Manager
├── modules/                   # Módulos del sistema
│   ├── audio.nix
│   ├── boot.nix
│   ├── desktops/
│   │   ├── hyprland.nix
│   │   └── plasma.nix
│   ├── graphics.nix
│   ├── kdeconnect.nix
│   ├── keyboard.nix
│   ├── locale.nix
│   ├── networking.nix
│   ├── packages.nix
│   └── users.nix
├── profiles/                  # Perfiles pre-configurados
│   ├── base.nix
│   ├── work.nix
│   ├── gaming.nix
│   ├── personal.nix
│   ├── hybrid.nix
│   └── minimal.nix
└── homeManagerModules/        # Configuración de usuario
    ├── git.nix
    ├── ssh.nix
    ├── hyprland.nix
    └── nvim/
        ├── default.nix
        └── lua/
```

## 🚀 Quick Start

### 1. Primera instalación

```bash
# Clona el repositorio
git clone https://github.com/MiguelGavito/nixos-config.git
cd nixos-config

# Copia tu hardware-configuration.nix
sudo cp /etc/nixos/hardware-configuration.nix .

# Elige un perfil editando configuration-new.nix
# Por defecto recomiendo ./profiles/hybrid.nix

# Renombra la configuración
mv configuration.nix configuration.nix.old
mv configuration-new.nix configuration.nix

# Reconstruye el sistema
sudo nixos-rebuild switch --flake .#elnavio
```

### 2. Cambiar de perfil

Edita `configuration.nix` y cambia la línea de import:

```nix
imports = [
  ./hardware-configuration.nix
  ./profiles/hybrid.nix  # Cambia esto por el perfil que prefieras
];
```

Luego reconstruye:

```bash
sudo nixos-rebuild switch --flake .#elnavio
```

## 📚 Perfiles Disponibles

| Perfil | Descripción | Uso |
|--------|-------------|-----|
| **base.nix** | Configuración mínima | Servidor/Headless |
| **work.nix** | Desarrollo profesional | Programación, Docker, VSCode |
| **gaming.nix** | Optimizado para juegos | Steam, Lutris, GameMode |
| **personal.nix** | Uso diario | Multimedia, Creatividad |
| **hybrid.nix** ⭐ | Todo en uno | Recomendado para empezar |
| **minimal.nix** | Ultra ligero con Hyprland | Minimalistas |

Ver [PROFILES.md](./PROFILES.md) para más detalles.

## ⌨️ Atajos de Neovim

| Atajo | Acción |
|-------|--------|
| `<Space>` | Leader key |
| `<Space>ff` | Buscar archivos |
| `<Space>fg` | Buscar en archivos (grep) |
| `<Space>e` | Toggle explorador de archivos |
| `<Space>w` | Guardar |
| `K` | Ver documentación |
| `gd` | Ir a definición |
| `<Space>ca` | Acciones de código |
| `<Space>rn` | Renombrar símbolo |

## 🎮 Hyprland Keybindings

| Atajo | Acción |
|-------|--------|
| `Super + Return` | Abrir terminal |
| `Super + D` | Launcher (Rofi) |
| `Super + Q` | Cerrar ventana |
| `Super + 1-9` | Cambiar workspace |
| `Super + Shift + 1-9` | Mover ventana a workspace |
| `Print` | Screenshot (copiar) |
| `Shift + Print` | Screenshot (guardar) |
| `Alt + Shift` | Cambiar layout de teclado |

## 🔧 Personalización

### Cambiar entre Plasma y Hyprland

Edita `modules/desktops/default.nix`:

```nix
{
  imports = [
    ./plasma.nix    # KDE Plasma
    # ./hyprland.nix  # Hyprland
  ];
}
```

### Añadir Hyprland a Home Manager

Edita `home.nix`:

```nix
{
  imports = [
    ./homeManagerModules
    ./homeManagerModules/hyprland.nix  # Descomentar para usar Hyprland
  ];
}
```

### Configurar teclado

El sistema está configurado con layouts español e inglés. Cambia entre ellos con `Alt+Shift`.

Para modificar, edita `modules/keyboard.nix`.

## 📦 Paquetes Incluidos

### Desarrollo
- Neovim (completamente configurado)
- VSCode
- Git, GitHub CLI
- Docker, Docker Compose
- LSPs: Nix, Lua, Python, TypeScript, Bash

### Productividad
- Firefox, Brave
- LibreOffice
- Nextcloud, OneDrive
- Discord, Slack

### Multimedia
- VLC, MPV
- Audacity
- OBS Studio

### Creatividad
- Blender
- GIMP, Inkscape, Krita
- Kdenlive

### Gaming
- Steam
- Lutris, Heroic
- GameMode, MangoHUD

## 🔄 Workflow Recomendado

1. **Crea una rama para experimentar**
   ```bash
   git checkout -b testing
   ```

2. **Haz cambios incrementales**
   ```bash
   # Edita configuración
   sudo nixos-rebuild switch --flake .#elnavio
   
   # Si algo falla, rollback
   sudo nixos-rebuild switch --rollback
   ```

3. **Commit cuando funcione**
   ```bash
   git add .
   git commit -m "feat: añadir configuración X"
   ```

4. **Merge cuando estés satisfecho**
   ```bash
   git checkout main
   git merge testing
   ```

## 🐛 Troubleshooting

### El sistema no arranca después de cambios

```bash
# Selecciona una generación anterior en el bootloader
# O desde un live USB:
sudo nixos-rebuild switch --rollback
```

### Neovim no encuentra los LSPs

```bash
# Verifica que los paquetes estén instalados
which lua-language-server
which nil_ls

# Reinstala si es necesario
sudo nixos-rebuild switch --flake .#elnavio
```

### Problemas con NVIDIA

Edita `modules/graphics.nix` y ajusta los Bus IDs:

```bash
# Encuentra tus Bus IDs
lspci | grep -E "VGA|3D"
```

## 📝 TODO

- [ ] Añadir más temas para Hyprland
- [ ] Configuración de Waybar más elaborada
- [ ] Scripts de automatización
- [ ] Perfiles para diferentes máquinas
- [ ] Secrets management con sops-nix
- [ ] Módulo para Docker con compose files

## 🤝 Contribuir

Este es un repositorio personal, pero siéntete libre de:
- Hacer fork
- Sugerir mejoras vía issues
- Aprender de la estructura

## 📄 Licencia

MIT

## 🙏 Agradecimientos

- [NixOS](https://nixos.org/)
- [Home Manager](https://github.com/nix-community/home-manager)
- [Hyprland](https://hyprland.org/)
- Comunidad de NixOS

---

**Nota**: Este es un trabajo en progreso. Crea ramas y experimenta libremente. ¡Disfruta de NixOS! 🎉
