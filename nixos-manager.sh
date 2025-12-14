#!/usr/bin/env bash
# Script de ayuda para gestionar configuraciones de NixOS

set -e

RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Función para imprimir con color
print_color() {
    color=$1
    message=$2
    echo -e "${color}${message}${NC}"
}

# Función para mostrar el banner
show_banner() {
    print_color "$BLUE" "
╔═══════════════════════════════════════════════════════════╗
║          NixOS Configuration Manager v1.0                 ║
║              by Miguel Gavito                             ║
╚═══════════════════════════════════════════════════════════╝
"
}

# Función para mostrar el menú principal
show_menu() {
    print_color "$GREEN" "\n📋 ¿Qué quieres hacer?\n"
    echo "1) 🔄 Cambiar de perfil"
    echo "2) 🏗️  Reconstruir sistema"
    echo "3) ↩️  Rollback (volver a configuración anterior)"
    echo "4) 🧹 Limpiar generaciones antiguas"
    echo "5) 📊 Ver estado del sistema"
    echo "6) 🖥️  Cambiar escritorio (Plasma/Hyprland)"
    echo "7) ℹ️  Información de perfiles"
    echo "8) 🚪 Salir"
    echo ""
}

# Función para listar perfiles
list_profiles() {
    print_color "$YELLOW" "\n📦 Perfiles disponibles:\n"
    echo "1) base      - Configuración mínima"
    echo "2) work      - Desarrollo/Trabajo (Docker, VSCode)"
    echo "3) gaming    - Gaming (Steam, GameMode)"
    echo "4) personal  - Uso personal (Multimedia, Creatividad)"
    echo "5) hybrid    - Todo en uno ⭐ RECOMENDADO"
    echo "6) minimal   - Minimalista con Hyprland"
    echo ""
}

# Función para cambiar de perfil
change_profile() {
    list_profiles
    read -p "Selecciona un perfil (1-6): " choice
    
    case $choice in
        1) profile="base" ;;
        2) profile="work" ;;
        3) profile="gaming" ;;
        4) profile="personal" ;;
        5) profile="hybrid" ;;
        6) profile="minimal" ;;
        *) 
            print_color "$RED" "❌ Opción inválida"
            return 1
            ;;
    esac
    
    print_color "$BLUE" "🔄 Cambiando a perfil: $profile"
    
    # Backup de configuration.nix actual
    if [ -f configuration.nix ]; then
        cp configuration.nix "configuration.nix.backup-$(date +%Y%m%d-%H%M%S)"
    fi
    
    # Crear nuevo configuration.nix
    cat > configuration.nix << EOF
# Configuración NixOS con perfil: $profile
# Generado automáticamente el $(date)

{ config, pkgs, ... }:

{
  imports = [
    ./hardware-configuration.nix
    ./profiles/${profile}.nix
  ];

  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  nixpkgs.config.allowUnfree = true;
  system.stateVersion = "25.11";
}
EOF
    
    print_color "$GREEN" "✅ Configuración actualizada a perfil: $profile"
    print_color "$YELLOW" "⚠️  Ejecuta la opción 2 para aplicar los cambios"
}

# Función para reconstruir el sistema
rebuild_system() {
    print_color "$BLUE" "🏗️  Reconstruyendo el sistema..."
    
    if sudo nixos-rebuild switch --flake .#elnavio; then
        print_color "$GREEN" "✅ Sistema reconstruido exitosamente"
    else
        print_color "$RED" "❌ Error al reconstruir el sistema"
        print_color "$YELLOW" "💡 Puedes hacer rollback con la opción 3"
        return 1
    fi
}

# Función para rollback
rollback_system() {
    print_color "$YELLOW" "↩️  Volviendo a la configuración anterior..."
    
    if sudo nixos-rebuild switch --rollback; then
        print_color "$GREEN" "✅ Rollback completado"
    else
        print_color "$RED" "❌ Error en rollback"
        return 1
    fi
}

# Función para limpiar generaciones
clean_generations() {
    print_color "$BLUE" "🧹 Limpiando generaciones antiguas..."
    
    print_color "$YELLOW" "\nGeneraciones actuales:"
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system
    
    read -p "\n¿Cuántos días de generaciones quieres mantener? (default: 7): " days
    days=${days:-7}
    
    print_color "$BLUE" "Eliminando generaciones de más de $days días..."
    
    if sudo nix-collect-garbage --delete-older-than ${days}d; then
        print_color "$GREEN" "✅ Limpieza completada"
        
        print_color "$BLUE" "\n💾 Espacio liberado:"
        df -h / | tail -1
    else
        print_color "$RED" "❌ Error en la limpieza"
        return 1
    fi
}

# Función para ver estado del sistema
show_system_info() {
    print_color "$BLUE" "\n📊 Estado del Sistema\n"
    
    echo "🖥️  Hostname: $(hostname)"
    echo "👤 Usuario: $USER"
    echo "🐧 Kernel: $(uname -r)"
    
    print_color "$YELLOW" "\n📦 Generaciones del sistema:"
    sudo nix-env --list-generations --profile /nix/var/nix/profiles/system | tail -5
    
    print_color "$YELLOW" "\n💾 Uso de disco:"
    df -h / | tail -1
    
    print_color "$YELLOW" "\n🔧 Perfil actual:"
    if [ -f configuration.nix ]; then
        grep "profiles/" configuration.nix | head -1 || echo "No se pudo determinar"
    fi
}

# Función para cambiar escritorio
change_desktop() {
    print_color "$YELLOW" "\n🖥️  Escritorios disponibles:\n"
    echo "1) KDE Plasma 6"
    echo "2) Hyprland (Wayland)"
    echo ""
    
    read -p "Selecciona un escritorio (1-2): " choice
    
    case $choice in
        1)
            desktop="plasma"
            print_color "$BLUE" "Configurando KDE Plasma..."
            cat > modules/desktops/default.nix << 'EOF'
{
  imports = [
    ./plasma.nix
  ];
}
EOF
            ;;
        2)
            desktop="hyprland"
            print_color "$BLUE" "Configurando Hyprland..."
            cat > modules/desktops/default.nix << 'EOF'
{
  imports = [
    ./hyprland.nix
  ];
}
EOF
            ;;
        *)
            print_color "$RED" "❌ Opción inválida"
            return 1
            ;;
    esac
    
    print_color "$GREEN" "✅ Escritorio cambiado a: $desktop"
    print_color "$YELLOW" "⚠️  Ejecuta la opción 2 para aplicar los cambios"
}

# Función para mostrar información de perfiles
show_profile_info() {
    print_color "$BLUE" "\n📚 Información de Perfiles\n"
    
    cat << 'EOF'
🔹 base
   - Configuración mínima
   - Sin escritorio gráfico
   - Para servidores

🔹 work
   - Desarrollo de software
   - Docker, VSCode, Git
   - KDE Plasma
   - SSH, GPG

🔹 gaming
   - Steam, Lutris
   - GameMode, MangoHUD
   - Optimizaciones para juegos
   - KDE Plasma

🔹 personal
   - Navegadores, multimedia
   - Blender, GIMP, Inkscape
   - Comunicación social
   - KDE Plasma

🔹 hybrid ⭐
   - Combina trabajo + personal + gaming
   - Perfil versátil
   - Recomendado para empezar

🔹 minimal
   - Hyprland (Wayland)
   - Sistema ultra-ligero
   - Para minimalistas

Para más información, lee README.md y PROFILES.md
EOF
}

# Main loop
show_banner

while true; do
    show_menu
    read -p "Selecciona una opción: " option
    
    case $option in
        1) change_profile ;;
        2) rebuild_system ;;
        3) rollback_system ;;
        4) clean_generations ;;
        5) show_system_info ;;
        6) change_desktop ;;
        7) show_profile_info ;;
        8)
            print_color "$GREEN" "👋 ¡Hasta luego!"
            exit 0
            ;;
        *)
            print_color "$RED" "❌ Opción inválida. Intenta de nuevo."
            ;;
    esac
    
    echo ""
    read -p "Presiona Enter para continuar..."
done
