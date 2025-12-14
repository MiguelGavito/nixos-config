# ⚡ Quick Start - Aplicar Cambios AHORA

Si quieres aplicar los cambios inmediatamente, sigue estos pasos:

## 🚀 Opción Rápida (5 minutos)

```bash
# 1. Hacer el script ejecutable
chmod +x nixos-manager.sh

# 2. Ejecutar el script
./nixos-manager.sh

# 3. En el menú:
# - Opción 1: Cambiar perfil (elige "hybrid")
# - Opción 2: Reconstruir sistema
# - Espera a que termine
# - ¡Listo!
```

## 📝 Opción Manual (10 minutos)

```bash
# 1. Revisar la nueva configuración
cat configuration-new.nix

# 2. Editar si quieres otro perfil (opcional)
nano configuration-new.nix
# Cambia ./profiles/hybrid.nix por el que prefieras

# 3. Probar sin aplicar (opcional pero recomendado)
sudo nixos-rebuild dry-build --flake .#elnavio

# 4. Aplicar los cambios
mv configuration.nix configuration.nix.old
mv configuration-new.nix configuration.nix
sudo nixos-rebuild switch --flake .#elnavio

# 5. Esperar y reiniciar
reboot
```

## ✅ Después de Aplicar

1. **Verifica que todo funcione** usando [CHECKLIST.md](CHECKLIST.md)
2. **Prueba Neovim**: `nvim test.txt` y presiona `<Space>ff`
3. **Cambia teclado**: `Alt+Shift`
4. **Si algo falla**: `sudo nixos-rebuild switch --rollback`

## 📚 Documentación Completa

Lee en este orden:
1. [RESUMEN.md](RESUMEN.md) - Qué se cambió
2. [MIGRATION.md](MIGRATION.md) - Cómo migrar
3. [README.md](README.md) - Guía completa
4. [PROFILES.md](PROFILES.md) - Info de perfiles
5. [CHECKLIST.md](CHECKLIST.md) - Verificar todo

## 🎯 Perfiles Disponibles

| Perfil | Para quién |
|--------|-----------|
| **hybrid** ⭐ | Todo en uno - RECOMENDADO |
| **work** | Desarrollo y productividad |
| **gaming** | Juegos y entretenimiento |
| **personal** | Uso diario, multimedia |
| **minimal** | Minimalistas con Hyprland |
| **base** | Servidores sin GUI |

## 🔑 Atajos Principales de Neovim

- `<Space>ff` - Buscar archivos
- `<Space>fg` - Buscar en archivos
- `<Space>e` - Explorador de archivos
- `<Space>w` - Guardar
- `K` - Documentación

## 🆘 Si Algo Sale Mal

```bash
# Opción 1: Rollback
sudo nixos-rebuild switch --rollback

# Opción 2: Volver a la config antigua
mv configuration.nix configuration.nix.modular
mv configuration.nix.backup configuration.nix
sudo nixos-rebuild switch --flake .#elnavio

# Opción 3: Seleccionar generación anterior en el bootloader
# (al reiniciar)
```

## 💡 Tips

- Tu configuración original está en `configuration.nix.backup`
- Puedes cambiar de perfil cuando quieras
- Usa `git` para versionar tus cambios
- El script `nixos-manager.sh` te ayuda con todo

## 🎉 ¡Listo!

Si completaste los pasos, tu sistema está actualizado con:
- ✅ Neovim profesional
- ✅ Teclado ES/EN
- ✅ KDE Connect
- ✅ Configuración modular
- ✅ Múltiples perfiles
- ✅ Hyprland disponible

**¡Disfruta tu nuevo NixOS!** 🚀
