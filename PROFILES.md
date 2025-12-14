# GUÍA DE USO DE PERFILES
# =====================

Este repositorio ahora tiene una estructura modular con perfiles pre-configurados.

## Estructura de Directorios

```
├── configuration.nix          # Configuración principal (ahora simplificada)
├── configuration-new.nix      # Nueva configuración modular
├── flake.nix                  # Configuración de flakes
├── hardware-configuration.nix # Configuración de hardware (generada automáticamente)
├── modules/                   # Módulos del sistema
│   ├── audio.nix             # PipeWire, Bluetooth
│   ├── boot.nix              # Configuración de arranque
│   ├── desktops/             # Entornos de escritorio
│   │   ├── hyprland.nix     # Configuración de Hyprland
│   │   ├── plasma.nix       # Configuración de KDE Plasma
│   │   └── default.nix      # Selector de escritorio
│   ├── graphics.nix          # NVIDIA/AMD
│   ├── kdeconnect.nix        # KDE Connect
│   ├── keyboard.nix          # Layouts de teclado (Español/Inglés)
│   ├── locale.nix            # Idioma y zona horaria
│   ├── networking.nix        # Red
│   ├── packages.nix          # Paquetes del sistema
│   └── users.nix             # Usuarios y shell
├── profiles/                  # Perfiles pre-configurados
│   ├── base.nix              # Base común
│   ├── work.nix              # Desarrollo/Trabajo
│   ├── gaming.nix            # Gaming
│   ├── personal.nix          # Uso personal
│   ├── hybrid.nix            # Todo en uno
│   └── minimal.nix           # Minimalista con Hyprland
└── homeManagerModules/        # Configuración de Home Manager
    ├── nvim/                 # Neovim configurado
    ├── git.nix               # Git
    └── ssh.nix               # SSH
```

## Perfiles Disponibles

### 1. Base (`profiles/base.nix`)
- Configuración mínima común
- Sin escritorio
- Solo terminal y herramientas básicas

### 2. Work (`profiles/work.nix`)
- Desarrollo de software
- Docker, VSCode, Git
- Productividad profesional
- KDE Plasma
- SSH, GPG

### 3. Gaming (`profiles/gaming.nix`)
- Steam, Lutris
- GameMode, MangoHUD
- Optimizaciones para juegos
- KDE Plasma

### 4. Personal (`profiles/personal.nix`)
- Navegadores, multimedia
- Creatividad (Blender, GIMP, Inkscape)
- Comunicación social
- KDE Plasma

### 5. Hybrid (`profiles/hybrid.nix`) ⭐ RECOMENDADO
- Combina trabajo + personal + gaming
- Perfil versátil para uso diario
- Incluye todo lo esencial

### 6. Minimal (`profiles/minimal.nix`)
- Hyprland (Wayland)
- Sistema ultra-ligero
- Para minimalistas

## Cómo Usar los Perfiles

### Opción 1: Usar la nueva configuración modular

1. Edita `configuration-new.nix` y cambia el import:

```nix
{
  imports = [
    ./hardware-configuration.nix
    ./profiles/hybrid.nix  # Cambia esto por el perfil que quieras
  ];
  
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
```

2. Renombra los archivos:
```bash
mv configuration.nix configuration.nix.old
mv configuration-new.nix configuration.nix
```

3. Reconstruye el sistema:
```bash
sudo nixos-rebuild switch --flake .#elnavio
```

### Opción 2: Editar el flake.nix directamente

Edita `flake.nix` para usar diferentes perfiles por host:

```nix
nixosConfigurations.elnavio = nixpkgs.lib.nixosSystem {
  system = "x86_64-linux";
  modules = [
    ./hardware-configuration.nix
    ./profiles/hybrid.nix  # Cambia el perfil aquí
    
    home-manager.nixosModules.home-manager
    {
      home-manager.useUserPackages = true;
      home-manager.users.miguelagg = import ./home.nix;
    }
  ];
};
```

## Cambiar entre Escritorios

Para cambiar entre KDE Plasma y Hyprland, edita `modules/desktops/default.nix`:

```nix
{
  imports = [
    # Descomentar el que quieras:
    ./plasma.nix
    # ./hyprland.nix
  ];
}
```

## Cambiar Layout de Teclado

El sistema está configurado para español e inglés. Cambia entre ellos con `Alt+Shift`.

Para cambiar la configuración, edita `modules/keyboard.nix`.

## Recomendaciones

- **Primera vez**: Usa el perfil `hybrid.nix`
- **Quieres rapidez**: Prueba `minimal.nix` con Hyprland
- **Solo gaming**: Usa `gaming.nix`
- **Solo trabajo**: Usa `work.nix`

## Neovim

La configuración de Neovim ha sido completamente actualizada con:
- LSP para Nix, Lua, Python, TypeScript, Bash
- Autocompletado inteligente
- Telescope para búsqueda
- Nvim-tree para explorador de archivos
- Tema Catppuccin
- GitSigns
- Which-key para ver atajos
- Y mucho más

### Atajos principales de Neovim:
- `<Space>` = Leader key
- `<Space>ff` = Buscar archivos
- `<Space>fg` = Buscar en archivos (grep)
- `<Space>e` = Toggle explorador de archivos
- `K` = Documentación
- `gd` = Ir a definición
- `<Space>ca` = Acciones de código
- `<Space>rn` = Renombrar símbolo

## KDE Connect

Configurado automáticamente. Solo necesitas instalar la app en tu móvil.

## Next Steps

1. Elige un perfil
2. Prueba el sistema
3. Ajusta según necesites
4. Crea una rama en git para experimentar
5. ¡Disfruta tu NixOS!
