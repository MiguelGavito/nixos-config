{ config, pkgs, ... }:

{
  # Configuración de teclado para el sistema
  services.xserver.xkb = {
    layout = "us,es";
    variant = ",";
    options = "grp:alt_shift_toggle"; # Cambia entre layouts con Alt+Shift
  };

  # Para entornos Wayland (como Hyprland)
  # Esta configuración se aplicará en el módulo de Hyprland

  # Configuración de consola (tty)
  console = {
    keyMap = "us";
    # Puedes cambiar esto a "es" si prefieres español por defecto en consola
  };

  # Variables de entorno para aplicaciones
  environment.sessionVariables = {
    # Esto ayuda con algunas aplicaciones que no detectan bien el layout
    XKB_DEFAULT_LAYOUT = "us,es";
    XKB_DEFAULT_OPTIONS = "grp:alt_shift_toggle";
  };
}
