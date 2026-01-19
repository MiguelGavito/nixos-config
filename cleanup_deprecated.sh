#!/usr/bin/env bash
# Script to clean deprecated folders after migration to ryan4yin structure

set -e

cd "$(dirname "$0")"

echo "🧹 Limpiando carpetas deprecadas..."
echo ""

# Deprecated folders to remove
DEPRECATED=(
    "home/programs"
    "home/shell"
    "home/ide"
    "home/desktop/hyprland"
)

# Check if backup exists
if [ ! -f "backup_deprecated_*.tar.gz" ]; then
    echo "⚠️  ADVERTENCIA: No se encontró backup. Creando uno ahora..."
    tar -czf "backup_deprecated_$(date +%Y%m%d_%H%M%S).tar.gz" \
        home/programs/ \
        home/shell/ \
        home/ide/ \
        home/desktop/hyprland/ 2>/dev/null || true
    echo "✅ Backup creado"
fi

echo ""
echo "📋 Carpetas a eliminar:"
for dir in "${DEPRECATED[@]}"; do
    if [ -d "$dir" ]; then
        echo "  - $dir"
    fi
done

echo ""
read -p "¿Continuar con la eliminación? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo "❌ Operación cancelada"
    exit 1
fi

echo ""
echo "🗑️  Eliminando carpetas deprecadas..."

for dir in "${DEPRECATED[@]}"; do
    if [ -d "$dir" ]; then
        rm -rf "$dir"
        echo "  ✅ Eliminado: $dir"
    else
        echo "  ⏭️  No existe: $dir"
    fi
done

# Also remove home/core.nix if it exists (deprecated single file)
if [ -f "home/core.nix" ]; then
    rm -f "home/core.nix"
    echo "  ✅ Eliminado: home/core.nix"
fi

echo ""
echo "✅ Limpieza completada"
echo ""
echo "📊 Estructura actual de home/:"
tree -L 2 home/ -I 'plugins' || ls -la home/

echo ""
echo "🔍 Próximo paso: Verificar que la configuración carga sin errores"
echo "   Ejecuta: nix flake check"
