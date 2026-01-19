# ✅ Migración Completada - Próximos Pasos

## Resumen de Cambios

La configuración nixos-config ha sido reorganizada siguiendo el patrón ryan4yin. Toda la estructura ahora es:

```
home/
├── base/              (cross-platform: core, tui, gui)
├── linux/             (linux-specific: gui/base, gui/wayland, gui/hyprland)
├── darwin/            (ready for macOS)
└── [DEPRECATED: programs/, shell/, ide/, desktop/hyprland/]

modules/
└── gaming.nix         (system gaming support)
```

## ✨ Lo que Cambió

### ✅ Creado
1. `home/base/default.nix` - Agregador que une core, tui, gui
2. `home/base/core/common.nix` - Herramientas CLI compartidas
3. `home/base/core/shells/common.nix` - Integraciones de shell (direnv, zoxide, fzf, eza, bat, skim)
4. `home/base/tui/tools/default.nix` - Orquestador de tools con scanPaths
5. `home/base/tui/tools/networking.nix` - SSH config + wget
6. `home/linux/gui/base/editors.nix` - VSCode migrado
7. `home/linux/gui/hyprland/default.nix` - Módulo Hyprland
8. `home/linux/gui/hyprland/conf/hyprland.conf` - Configuración completa
9. `home/linux/gui/wayland/env.nix` - Variables de entorno Wayland

### 🔄 Actualizado
1. `home/default.nix` - Simplificado para importar base, linux, darwin
2. `home/base/core/default.nix` - Añadido ./common.nix
3. `home/base/core/shells/default.nix` - Añadido ./common.nix
4. `home/linux/gui/default.nix` - Añadido ./hyprland
5. `home/linux/gui/wayland/default.nix` - Añadido ./env.nix import
6. `outputs/x86_64-linux/src/elnavio.nix` - Simplificado a importar home/ como agregador

## 🧪 Cómo Probar

### 1. Verificar sintaxis Nix (opcional pero recomendado)
```bash
# En la raíz del proyecto:
nix flake check

# O solo evaluar home-manager:
nix eval --json '.#nixosConfigurations.elnavio.config.home-manager'
```

### 2. Construir la configuración
```bash
# Con flake:
nix build '.#nixosConfigurations.elnavio.config.home-manager.activationPackage'

# Y luego aplicar:
./result/activate
```

### 3. Verificar módulos específicos
```bash
# Verificar que shells funcionan:
nix eval --json '.#nixosConfigurations.elnavio.config.home-manager.users.miguelagg.programs.bash.enable'

# Verificar VSCode:
nix eval --json '.#nixosConfigurations.elnavio.config.home-manager.users.miguelagg.programs.vscode.enable'

# Verificar Wayland env:
nix eval --json '.#nixosConfigurations.elnavio.config.home-manager.users.miguelagg.home.sessionVariables.XDG_SESSION_TYPE'
```

## 📋 Checklist de Validación

Después de aplicar los cambios, verifica:

- [ ] Shells (bash, zsh, nushell) funcionan normalmente
- [ ] Shell tools se cargan: `which zoxide`, `which fzf`, `which direnv`
- [ ] Git config es correcto: `git config --global user.name`
- [ ] Neovim funciona: `nvim --version`
- [ ] VSCode abre con extensiones: `code --list-extensions`
- [ ] SSH config correcto: `cat ~/.ssh/config`
- [ ] Hyprland inicia sin errores (si usas Hyprland): `hyprland --version`
- [ ] Wayland env vars están set (si usas Wayland): `echo $XDG_SESSION_TYPE`
- [ ] Gaming tools disponibles (si habilitaste): `which steam`, `which lutris`

## 🗑️ Limpieza (Después de Validar)

**IMPORTANTE: Solo hacer después de confirmar que TODO funciona correctamente**

Una vez que hayas verificado que la nueva estructura funciona, puedes limpiar las carpetas antiguas:

### Paso 1: Remover directorios deprecados
```bash
# Backup primero (por seguridad):
cd /workspaces/nixos-config/home
tar -czf backup_deprecated.tar.gz programs/ shell/ ide/ desktop/hyprland/

# Remover carpetas antiguas:
rm -rf programs/        # ✅ TODO migrado a linux/gui/base/
rm -rf shell/          # ✅ TODO migrado a base/core/shells y base/tui/tools
# rm -f ide/vscode.nix   # ✅ Migrado a linux/gui/base/editors.nix
# keep ide/nvim/ por ahora (duplicado de base/tui/editors/nvim - consolidar después)
# rm -rf desktop/hyprland/  # ✅ Migrado a linux/gui/hyprland/
```

### Paso 2: Consolidar Neovim (opcional pero recomendado)
```bash
# Ambas ubicaciones son idénticas, así que podemos eliminar una:
# Option A: Eliminar la copia de ide/ (mantener base/tui/editors/nvim/)
# rm -rf home/ide/nvim/
# home/ide/vscode.nix ya fue eliminado arriba, así que ide/ puede quedar vacío o eliminarse

# Pero mantener el alias por compatibilidad si algún otro archivo lo referencia:
# Verificar primero qué referencias home/ide/nvim/ tiene:
# grep -r "home/ide/nvim" --include="*.nix"
```

### Paso 3: Limpiar imports en archivos que aún referencien las carpetas antiguas
```bash
# Si hay archivos que importan de home/programs/, home/shell/, etc, actualizar:
# grep -r "home/programs" --include="*.nix"
# grep -r "home/shell" --include="*.nix"
# grep -r "home/ide" --include="*.nix"
```

## 📚 Documentación de la Nueva Estructura

- `MIGRATION_COMPLETE.md` - Resumen detallado de lo completado
- `MIGRATION_PROGRESS.md` - Progreso paso a paso (técnico)
- `STRUCTURE_DIAGRAM.md` - Diagrama visual de la estructura final
- `MIGRATION_TODO.md` - Este archivo (próximos pasos)

## 🎯 Referencia

**Ryan4Yin's nix-config:**
https://github.com/ryan4yin/nix-config/tree/main/home

**Patrón seguido:**
```
home/base/
├── core/    → Essential tools (shells, editors, git, theme, etc)
├── tui/     → Terminal UIs (neovim, tmux, networking)
└── gui/     → Cross-platform GUI (terminals, dev-tools, media)

home/linux/gui/
├── base/    → Desktop applications
├── wayland/ → Wayland-specific config
└── hyprland/→ Hyprland compositor
```

## ⚠️ Notas Importantes

1. **Archivos No Migrados (A Propósito):**
   - `home/ide/nvim/` - Ya existe la versión correcta en `home/base/tui/editors/nvim/`
   - `home/desktop/niri/` - Permanece en lugar de migrarse (es compositor específico)

2. **Duplicados:**
   - `home/ide/nvim/` y `home/base/tui/editors/nvim/` son 99% idénticos
   - Después de validar, remover uno (probablemente ide/nvim)

3. **Compatibilidad:**
   - Los archivos old (programs/, shell/, etc) pueden coexistir hasta que verifiques todo funciona
   - El import en home/default.nix ya está actualizado para NO importarlos

4. **Catppuccin Theming:**
   - Centralizado en `home/base/core/theme.nix`
   - Se aplica a todas las GUI apps que lo soporten

## 🚀 Comandos Útiles Para Testing

```bash
# Listar qué va a cambiar:
nix flake diff

# Evaluar configuración sin aplicar:
nix eval --json '.#nixosConfigurations.elnavio' | head -50

# Encontrar errores en imports:
nix eval '.#nixosConfigurations.elnavio.config.home-manager' 2>&1 | grep -i error

# Verificar estructura de carpetas:
find home -name "default.nix" | sort
```

## ✅ Validación Final

Una vez hayas completado los pasos anteriores y verificado todo:

```bash
# Hacer commit de los cambios:
git add -A
git commit -m "refactor: reorganize home-manager config to ryan4yin structure

- Created home/base/ aggregator with core, tui, gui
- Migrated linux-specific GUI apps to home/linux/gui/base/
- Migrated Hyprland to home/linux/gui/hyprland/
- Created home/linux/gui/wayland/env.nix
- Created home/base/core/common.nix and shells/common.nix
- Created home/base/tui/tools/networking.nix
- Updated imports throughout hierarchy
- Simplified elnavio.nix home-modules
- Deprecated: programs/, shell/, ide/vscode.nix, desktop/hyprland/
"

# Push:
git push origin main
```

## 🤝 Support

Si algo no funciona:
1. Revisar los archivos en `/workspaces/nixos-config/home/base/core/` para syntax correcto
2. Verificar que `mylib.scanPaths` está disponible en elnavio.nix
3. Revisar imports en orden: home/ → base/ → core/
4. Comparar estructura con ryan4yin/nix-config

---

**Estado:** ✅ Migración Completada
**Próximo Paso:** Testing y validación
**Paso Después:** Limpieza de carpetas deprecadas
