# NixOS configuration

this is not a tutorial nor a guide or similar, is the configuration from a newbie that is leaning, i do no recommend clone or try to build this repository without knowledge of nix or similar and do not use my host acounts configurations.

##philosophy:

This github repository (temporary private before i learn how to secure all information) need to follow this ideas: MODULARITY, PORPUSE, EXPANDIBLE.

This repository as well is a personal proyect where i learn how to configure all of it, it may have error but the objetive is to learn and solve them.

## Desktop Desing and workflow rules

The workflow design need to follow this rules:
- Simple to use
- Minimalist
- Efficient

the principal idea is to config all the system to need only the keyboard to work, this may need more use of terminal, programs as vim and emacs and similar things.


# KEYBINDINGS


# Atajos de Teclado - Window Managers

## Niri

### Aplicaciones básicas
- `Super + Enter` → Terminal (kitty)
- `Super + Space` → Launcher (wofi)
- `Super + Escape` → Lock screen (swaylock)

### Gestión de ventanas
- `Super + Q` → Cerrar ventana actual
- `Super + H/J/K/L` → Mover foco (izquierda/abajo/arriba/derecha)
- `Super + Shift + H/J/K/L` → Mover ventana

### Workspaces
- `Super + 1/2/3/4/5` → Ir a workspace
- `Super + Shift + 1/2/3/4/5` → Mover ventana a workspace

### Sistema
- `Super + Shift + E` → Salir de Niri
- `Super + Shift + R` → Reiniciar Niri
- `Print` → Screenshot (área seleccionada)

---

## Hyprland

### Aplicaciones básicas
- `Super + Enter` → Terminal (kitty)
- `Super + Space` → Launcher (wofi)
- `Super + Escape` → Lock screen (swaylock)

### Gestión de ventanas
- `Super + Q` → Cerrar ventana actual
- `Super + F` → Fullscreen
- `Super + V` → Toggle floating
- `Super + H/J/K/L` → Mover foco (izquierda/abajo/arriba/derecha)
- `Super + Shift + H/J/K/L` → Mover ventana

### Workspaces
- `Super + 1/2/3/4/5` → Ir a workspace
- `Super + Shift + 1/2/3/4/5` → Mover ventana a workspace

### Sistema
- `Super + M` → Salir de Hyprland
- `Print` → Screenshot (área seleccionada)

### Multimedia (teclas de función)
- `XF86MonBrightnessUp/Down` → Brillo
- `XF86AudioRaiseVolume/LowerVolume` → Volumen
- `XF86AudioMute` → Mutear
- `XF86AudioPlay/Next/Prev` → Control de reproducción

### Mouse
- `Super + Click izquierdo` → Mover ventana
- `Super + Click derecho` → Redimensionar ventana

---

## Notas importantes

- **Super** = Tecla Windows/Command
- Los atajos son consistentes entre ambos WMs donde es posible
- Wofi se abre con `Super + Space` para buscar y lanzar aplicaciones
- Kitty es el terminal por defecto (rápido y con GPU acceleration)
