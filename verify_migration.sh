#!/usr/bin/env bash
# Verification checklist for post-migration configuration

set -e

echo "🔍 VERIFICACIÓN POST-MIGRACIÓN"
echo "=============================="
echo ""

# Colors
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

check_file() {
    if [ -f "$1" ]; then
        echo -e "${GREEN}✅${NC} $1"
        return 0
    else
        echo -e "${RED}❌${NC} $1 (no existe)"
        return 1
    fi
}

check_dir() {
    if [ -d "$1" ]; then
        echo -e "${GREEN}✅${NC} $1/"
        return 0
    else
        echo -e "${RED}❌${NC} $1/ (no existe)"
        return 1
    fi
}

check_deprecated() {
    if [ -d "$1" ] || [ -f "$1" ]; then
        echo -e "${YELLOW}⚠️${NC}  $1 (debería estar eliminado)"
        return 1
    else
        echo -e "${GREEN}✅${NC} $1 (eliminado correctamente)"
        return 0
    fi
}

echo "📁 ESTRUCTURA NUEVA (debe existir)"
echo "----------------------------------"
check_dir "home/base"
check_dir "home/base/core"
check_dir "home/base/tui"
check_dir "home/base/gui"
check_dir "home/linux"
check_dir "home/linux/gui"
check_dir "home/linux/gui/base"
check_dir "home/linux/gui/wayland"
check_dir "home/linux/gui/hyprland"

echo ""
echo "📄 ARCHIVOS NUEVOS (deben existir)"
echo "----------------------------------"
check_file "home/base/default.nix"
check_file "home/base/core/common.nix"
check_file "home/base/core/shells/common.nix"
check_file "home/base/tui/tools/default.nix"
check_file "home/base/tui/tools/networking.nix"
check_file "home/linux/gui/base/editors.nix"
check_file "home/linux/gui/hyprland/default.nix"
check_file "home/linux/gui/hyprland/conf/hyprland.conf"
check_file "home/linux/gui/wayland/env.nix"

echo ""
echo "🗑️  ARCHIVOS DEPRECADOS (deben estar eliminados)"
echo "-----------------------------------------------"
check_deprecated "home/programs"
check_deprecated "home/shell"
check_deprecated "home/ide/vscode.nix"
check_deprecated "home/desktop/hyprland"
check_deprecated "home/core.nix"

echo ""
echo "⚙️  CONFIGURACIÓN DEL SISTEMA"
echo "----------------------------"
check_file "modules/gaming.nix"
check_file "modules/programs.nix"

echo ""
echo "🔗 VERIFICAR IMPORTS"
echo "-------------------"

# Check if home/default.nix imports base, linux, darwin
if grep -q "./base" home/default.nix; then
    echo -e "${GREEN}✅${NC} home/default.nix importa ./base"
else
    echo -e "${RED}❌${NC} home/default.nix NO importa ./base"
fi

if grep -q "./linux" home/default.nix; then
    echo -e "${GREEN}✅${NC} home/default.nix importa ./linux"
else
    echo -e "${RED}❌${NC} home/default.nix NO importa ./linux"
fi

# Check if home/base/default.nix imports core, tui, gui
if grep -q "./core" home/base/default.nix && grep -q "./tui" home/base/default.nix && grep -q "./gui" home/base/default.nix; then
    echo -e "${GREEN}✅${NC} home/base/default.nix importa core, tui, gui"
else
    echo -e "${RED}❌${NC} home/base/default.nix falta imports"
fi

# Check if modules/gaming.nix has gamemode enabled
if grep -q "programs.gamemode.enable = true" modules/gaming.nix; then
    echo -e "${GREEN}✅${NC} modules/gaming.nix tiene gamemode habilitado"
else
    echo -e "${YELLOW}⚠️${NC}  modules/gaming.nix NO tiene gamemode habilitado"
fi

# Check if modules/gaming.nix has STEAM_EXTRA_COMPAT_TOOLS_PATHS
if grep -q "STEAM_EXTRA_COMPAT_TOOLS_PATHS" modules/gaming.nix; then
    echo -e "${GREEN}✅${NC} modules/gaming.nix tiene STEAM_EXTRA_COMPAT_TOOLS_PATHS"
else
    echo -e "${YELLOW}⚠️${NC}  modules/gaming.nix NO tiene STEAM_EXTRA_COMPAT_TOOLS_PATHS"
fi

# Check if elnavio.nix enables gaming
if grep -q "modules.gaming.enable = true" outputs/x86_64-linux/src/elnavio.nix; then
    echo -e "${GREEN}✅${NC} elnavio.nix habilita gaming"
else
    echo -e "${RED}❌${NC} elnavio.nix NO habilita gaming"
fi

echo ""
echo "📊 RESUMEN"
echo "---------"
echo "Estructura migrada: home/base/, home/linux/gui/"
echo "Gaming configurado: modules/gaming.nix"
echo "Imports actualizados: home/default.nix → base/linux/darwin"
echo ""
echo "🚀 PRÓXIMOS PASOS:"
echo "1. Ejecutar limpieza: bash cleanup_deprecated.sh"
echo "2. Verificar sintaxis: nix flake check"
echo "3. Reconstruir sistema: sudo nixos-rebuild switch --flake .#elnavio"
echo "4. Verificar aplicaciones: code, steam, hyprland, etc."
