# ✅ Checklist Post-Instalación

Usa este checklist después de migrar a la nueva configuración para verificar que todo funcione correctamente.

## 🔍 Verificaciones Básicas

### Sistema
- [ ] El sistema arranca correctamente
- [ ] No hay errores en el boot
- [ ] La pantalla de login aparece
- [ ] Puedes iniciar sesión

### Escritorio
- [ ] El escritorio (KDE/Hyprland) inicia correctamente
- [ ] El wallpaper se muestra
- [ ] La barra de tareas/waybar funciona
- [ ] Los íconos se muestran correctamente

### Hardware
- [ ] La tarjeta gráfica funciona (NVIDIA/AMD)
- [ ] El audio funciona
- [ ] El micrófono funciona
- [ ] Bluetooth detecta dispositivos
- [ ] WiFi/Ethernet conecta
- [ ] El touchpad funciona (si laptop)
- [ ] Los monitores externos funcionan

## ⌨️ Verificaciones de Teclado

- [ ] El teclado responde
- [ ] El layout por defecto es el esperado
- [ ] Puedo cambiar entre Español/Inglés con `Alt+Shift`
- [ ] Los caracteres especiales funcionan (ñ, á, é, í, ó, ú)
- [ ] Los atajos del sistema funcionan

### Test de Teclado
```bash
# En terminal, prueba escribir:
echo "Español: ñ á é í ó ú ¿ ¡"
echo "English: test 123"
```

## 🛠️ Verificaciones de Software

### Terminal y Shell
- [ ] ZSH está configurado
- [ ] Oh-My-Zsh funciona
- [ ] El tema agnoster se muestra
- [ ] Los plugins de zsh funcionan (git, z)
- [ ] Git está instalado y configurado

```bash
# Verificar ZSH
echo $SHELL  # Debe mostrar /run/current-system/sw/bin/zsh

# Verificar Git
git --version
git config --list
```

### Neovim
- [ ] Neovim abre sin errores
- [ ] El tema Catppuccin se muestra
- [ ] La statusline (lualine) aparece
- [ ] Los LSPs funcionan
- [ ] El autocompletado funciona
- [ ] Telescope abre con `<Space>ff`
- [ ] Nvim-tree abre con `<Space>e`
- [ ] Los keybindings funcionan

```bash
# Test de Neovim
nvim --version

# Abrir un archivo y probar
nvim test.nix
# Dentro de nvim:
# - Presiona <Space>ff (debería abrir Telescope)
# - Presiona <Space>e (debería abrir nvim-tree)
# - Escribe algo y prueba autocompletado
# - Prueba :checkhealth para ver el estado
```

### Navegadores
- [ ] Firefox abre
- [ ] Brave abre (si está en tu perfil)
- [ ] Los navegadores pueden acceder a internet
- [ ] Las extensiones se pueden instalar

### VSCode
- [ ] VSCode abre
- [ ] Puede instalar extensiones
- [ ] El terminal integrado funciona
- [ ] Git funciona dentro de VSCode

### Docker (si perfil work/hybrid)
- [ ] Docker está instalado
- [ ] Docker daemon está corriendo
- [ ] Puedo ejecutar contenedores

```bash
# Verificar Docker
docker --version
docker ps
docker run hello-world
```

## 📱 KDE Connect

- [ ] KDE Connect está instalado
- [ ] Los puertos están abiertos
- [ ] Puedo ver mi dispositivo móvil
- [ ] La sincronización funciona
- [ ] Puedo enviar archivos
- [ ] Las notificaciones llegan

```bash
# Test de KDE Connect
systemctl --user status kdeconnect
```

## 🎮 Gaming (si perfil gaming/hybrid)

- [ ] Steam abre
- [ ] Puedo iniciar sesión en Steam
- [ ] Puedo instalar juegos
- [ ] Los juegos arrancan
- [ ] GameMode funciona
- [ ] Lutris funciona (si instalado)

```bash
# Verificar GameMode
gamemoded --version

# Ejecutar un juego con GameMode
# gamemoderun <juego>
```

## 🖼️ Multimedia

- [ ] VLC reproduce videos
- [ ] VLC reproduce audio
- [ ] Audacity puede grabar
- [ ] Las teclas multimedia funcionan
- [ ] El control de volumen funciona

## 📦 Paquetes Específicos del Perfil

### Work Profile
- [ ] Docker funciona
- [ ] VSCode funciona
- [ ] Git funciona
- [ ] SSH funciona
- [ ] GPG funciona (si configurado)

### Gaming Profile
- [ ] Steam funciona
- [ ] Lutris funciona
- [ ] GameMode funciona
- [ ] MangoHUD funciona

### Personal Profile
- [ ] Blender abre
- [ ] GIMP funciona
- [ ] Inkscape funciona
- [ ] Kdenlive funciona

## 🌐 Red y Conectividad

- [ ] Puedo hacer ping a internet
- [ ] DNS resuelve correctamente
- [ ] Puedo navegar por internet
- [ ] Puedo clonar repos de GitHub
- [ ] KDE Connect se conecta (si móvil en la misma red)

```bash
# Test de conectividad
ping -c 4 8.8.8.8
ping -c 4 google.com
curl -I https://github.com
```

## 🎨 Hyprland (si usas el perfil minimal o configuraste Hyprland)

- [ ] Hyprland inicia
- [ ] Waybar aparece
- [ ] Rofi abre con `Super+D`
- [ ] Kitty abre con `Super+Return`
- [ ] Screenshots funcionan
- [ ] Los workspaces cambian con `Super+1-9`
- [ ] Puedo mover ventanas entre workspaces

## 🔧 Comandos de Verificación

Ejecuta estos comandos para verificar el estado general:

```bash
# Ver información del sistema
neofetch

# Ver generaciones de NixOS
sudo nix-env --list-generations --profile /nix/var/nix/profiles/system

# Ver logs del sistema
journalctl -b -p err

# Verificar servicios críticos
systemctl status NetworkManager
systemctl status pipewire
systemctl --user status pipewire

# Ver uso de disco
df -h
nix-store --gc --print-dead

# Ver procesos
htop

# Verificar variables de entorno
env | grep -E "XDG|NIXOS"
```

## 📊 Métricas de Rendimiento

- [ ] El sistema arranca en menos de 30 segundos
- [ ] El uso de RAM es razonable (<2GB en idle)
- [ ] El uso de CPU en idle es bajo (<10%)
- [ ] No hay procesos zombies o problemáticos

```bash
# Ver tiempo de arranque
systemd-analyze

# Ver servicios más lentos
systemd-analyze blame

# Ver uso de recursos
htop
```

## 🐛 Problemas Comunes y Soluciones

### Si algo no funciona:

1. **Revisa los logs**
   ```bash
   journalctl -b -p err
   ```

2. **Verifica el estado de servicios**
   ```bash
   systemctl status <servicio>
   ```

3. **Haz un rebuild**
   ```bash
   sudo nixos-rebuild switch --flake .#elnavio
   ```

4. **Si todo falla, haz rollback**
   ```bash
   sudo nixos-rebuild switch --rollback
   ```

5. **Usa el script de ayuda**
   ```bash
   ./nixos-manager.sh
   ```

## ✨ Extras

### Configuración Adicional Recomendada

- [ ] Configurar Git con tu email y nombre
  ```bash
  git config --global user.name "Tu Nombre"
  git config --global user.email "tu@email.com"
  ```

- [ ] Configurar SSH
  ```bash
  ssh-keygen -t ed25519 -C "tu@email.com"
  ```

- [ ] Añadir clave SSH a GitHub
  ```bash
  cat ~/.ssh/id_ed25519.pub
  # Copiar y pegar en GitHub
  ```

- [ ] Configurar GPG para firmar commits (opcional)
  ```bash
  gpg --full-generate-key
  gpg --list-secret-keys --keyid-format LONG
  git config --global user.signingkey <KEY_ID>
  git config --global commit.gpgsign true
  ```

### Personalizaciones

- [ ] Cambiar el tema de KDE/Hyprland
- [ ] Configurar wallpapers
- [ ] Añadir widgets/applets
- [ ] Configurar atajos de teclado personalizados
- [ ] Instalar fuentes adicionales
- [ ] Configurar Neovim con tus preferencias

## 📝 Notas

Si encuentras algún problema o tienes sugerencias:

1. Revisa [MIGRATION.md](MIGRATION.md)
2. Lee [README.md](README.md)
3. Consulta [PROFILES.md](PROFILES.md)
4. Revisa los módulos en `modules/`
5. Crea un issue en GitHub (si el repo es público)

## 🎉 Completado

Si todo en este checklist está marcado, ¡felicitaciones! Tu sistema NixOS está completamente configurado y funcionando.

**Siguiente paso**: Disfruta de tu sistema y personalízalo a tu gusto.

---

**Fecha de verificación**: _______________
**Perfil usado**: _______________
**Notas adicionales**: _______________
