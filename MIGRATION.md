# 🔄 Guía de Migración a la Nueva Estructura

Esta guía te ayudará a migrar de tu configuración actual a la nueva estructura modular.

## ⚠️ IMPORTANTE - Lee antes de aplicar

Tu configuración original ha sido respaldada como `configuration.nix.backup`.

## 📋 Pasos para Migrar

### Paso 1: Revisar los archivos creados

Se han creado los siguientes archivos y directorios:

```
✅ modules/                    # Módulos del sistema
   ├── audio.nix               # Configuración de audio
   ├── boot.nix                # Bootloader
   ├── desktops/               # Escritorios
   │   ├── default.nix
   │   ├── hyprland.nix
   │   └── plasma.nix
   ├── graphics.nix            # NVIDIA/AMD
   ├── kdeconnect.nix          # KDE Connect ✨ NUEVO
   ├── keyboard.nix            # Teclado ES/EN ✨ NUEVO
   ├── locale.nix              # Idioma y zona horaria
   ├── networking.nix          # Red
   ├── packages.nix            # Paquetes del sistema
   └── users.nix               # Usuarios

✅ profiles/                   # Perfiles pre-configurados ✨ NUEVO
   ├── base.nix
   ├── work.nix
   ├── gaming.nix
   ├── personal.nix
   ├── hybrid.nix
   └── minimal.nix

✅ homeManagerModules/nvim/    # Neovim mejorado ✨ ACTUALIZADO
   ├── default.nix             # Plugins actualizados
   ├── options.lua             # Opciones mejoradas
   └── lua/
       ├── cmp.lua
       ├── lsp.lua             # LSP mejorado
       ├── nvim-tree.lua       # ✨ NUEVO
       ├── other.lua           # Keybindings ✨ NUEVO
       ├── telescope.lua       # Con keybindings
       └── treesitter.lua

✅ homeManagerModules/hyprland.nix  # Configuración de Hyprland ✨ NUEVO

✅ configuration-new.nix       # Nueva configuración modular
✅ nixos-manager.sh            # Script de ayuda ✨ NUEVO
✅ README.md                   # Documentación completa
✅ PROFILES.md                 # Guía de perfiles
```

### Paso 2: Hacer ejecutable el script de ayuda

```bash
chmod +x nixos-manager.sh
```

### Paso 3: Elegir cómo migrar

Tienes dos opciones:

#### Opción A: Migración Manual (Recomendado para primera vez)

1. Revisa la nueva configuración:
   ```bash
   cat configuration-new.nix
   ```

2. Elige un perfil editando `configuration-new.nix`:
   ```nix
   imports = [
     ./hardware-configuration.nix
     ./profiles/hybrid.nix  # Cambia esto por el perfil que prefieras
   ];
   ```

3. Prueba la configuración sin aplicarla:
   ```bash
   sudo nixos-rebuild dry-build --flake .#elnavio
   ```

4. Si todo se ve bien, aplica los cambios:
   ```bash
   # Respalda la configuración actual
   mv configuration.nix configuration.nix.old
   mv configuration-new.nix configuration.nix
   
   # Actualiza el flake
   nix flake update
   
   # Aplica la configuración
   sudo nixos-rebuild switch --flake .#elnavio
   ```

#### Opción B: Usar el script de ayuda

```bash
./nixos-manager.sh
```

El script te guiará paso a paso.

### Paso 4: Configurar Hyprland (Opcional)

Si quieres usar Hyprland en lugar de KDE Plasma:

1. Edita `modules/desktops/default.nix`:
   ```nix
   {
     imports = [
       # ./plasma.nix
       ./hyprland.nix
     ];
   }
   ```

2. Edita `home.nix` y añade:
   ```nix
   {
     imports = [
       ./homeManagerModules
       ./homeManagerModules/hyprland.nix  # Añadir esta línea
     ];
   }
   ```

3. Reconstruye:
   ```bash
   sudo nixos-rebuild switch --flake .#elnavio
   ```

### Paso 5: Verificar que todo funcione

Después de la migración, verifica:

1. **Sistema arrancó correctamente** ✓
2. **Escritorio funciona** (KDE o Hyprland)
3. **Teclado cambia entre ES/EN** (Alt+Shift)
4. **Neovim funciona** (abre `nvim` y prueba `<Space>ff`)
5. **KDE Connect** (si lo usas)

## 🎯 Qué Cambios Importantes hay

### Neovim

#### ✨ Nuevos Plugins
- **Catppuccin theme** - Tema moderno
- **nvim-tree** - Explorador de archivos (`<Space>e`)
- **lualine** - Statusline mejorada
- **gitsigns** - Integración con Git
- **which-key** - Muestra atajos disponibles
- **nvim-autopairs** - Cierra paréntesis automáticamente
- **comment.nvim** - Comenta código fácilmente
- **indent-blankline** - Guías de indentación

#### 🔧 LSP Mejorado
- Ahora incluye LSPs para:
  - Nix (nil_ls)
  - Lua (lua_ls)
  - Python (pyright)
  - TypeScript/JavaScript (ts_ls)
  - Bash (bashls)

#### ⌨️ Nuevos Atajos
- `<Space>ff` - Buscar archivos
- `<Space>fg` - Buscar en archivos
- `<Space>e` - Toggle explorador
- `<Space>w` - Guardar
- `<Space>ca` - Acciones de código
- Ver [README.md](README.md) para más

### Sistema

#### ✨ Nuevo: KDE Connect
- Sincroniza con tu móvil
- Comparte archivos
- Notificaciones
- Control remoto

#### ✨ Nuevo: Teclado Español/Inglés
- Cambia con `Alt+Shift`
- Configurado en `modules/keyboard.nix`

#### ✨ Nuevo: Perfiles
- 6 perfiles pre-configurados
- Fácil cambio entre ellos
- Ver [PROFILES.md](PROFILES.md)

#### ✨ Nuevo: Soporte Hyprland
- Compositor Wayland moderno
- Configuración completa en Home Manager
- Waybar, Rofi, Kitty incluidos

## 🔄 Rollback si algo falla

Si algo no funciona:

### Opción 1: Desde el bootloader
1. Reinicia
2. Selecciona una generación anterior
3. Arranca

### Opción 2: Desde terminal
```bash
sudo nixos-rebuild switch --rollback
```

### Opción 3: Volver a la configuración antigua
```bash
mv configuration.nix configuration.nix.modular
mv configuration.nix.backup configuration.nix
sudo nixos-rebuild switch --flake .#elnavio
```

## 📚 Siguiente Pasos

1. **Experimenta con perfiles** - Prueba diferentes perfiles
2. **Personaliza Neovim** - Añade tus plugins favoritos
3. **Configura Hyprland** - Si te gusta Wayland
4. **Crea ramas** - Experimenta sin miedo
5. **Lee la documentación** - [README.md](README.md) y [PROFILES.md](PROFILES.md)

## ❓ Preguntas Frecuentes

### ¿Puedo volver a la configuración anterior?
Sí, tu configuración original está en `configuration.nix.backup`.

### ¿Qué perfil debo usar?
Recomendamos empezar con `hybrid.nix` que incluye todo.

### ¿Cómo actualizo el sistema?
```bash
nix flake update
sudo nixos-rebuild switch --flake .#elnavio
```

### ¿Cómo añado paquetes?
Edita el perfil que estés usando o `modules/packages.nix`.

### ¿Puedo combinar perfiles?
Sí, puedes crear tu propio perfil que importe otros módulos.

### ¿Funciona en otras máquinas?
Sí, pero necesitas copiar el `hardware-configuration.nix` de cada máquina.

## 🐛 Problemas Conocidos

### NVIDIA no funciona
Ajusta los Bus IDs en `modules/graphics.nix`:
```bash
lspci | grep -E "VGA|3D"
```

### Neovim no encuentra LSPs
Verifica la instalación:
```bash
which lua-language-server
which nil_ls
```

### Hyprland no inicia
Asegúrate de haber importado el módulo en `home.nix` y `modules/desktops/default.nix`.

## 💡 Tips

- **Usa branches para experimentar**: `git checkout -b testing`
- **Commit frecuentemente**: Si algo funciona, haz commit
- **Lee los módulos**: Están bien documentados
- **Personaliza**: Esta es tu configuración, hazla tuya

## 🎉 ¡Disfruta!

Tu NixOS ahora tiene:
- ✅ Estructura modular
- ✅ Perfiles flexibles  
- ✅ Neovim mejorado
- ✅ Teclado bilingüe
- ✅ KDE Connect
- ✅ Soporte Hyprland
- ✅ Fácil de mantener

¡Feliz hacking! 🚀
