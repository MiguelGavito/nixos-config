{ config, pkgs, ... }:

{
  # Hardware de gráficos
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Configuración de NVIDIA
  hardware.nvidia = {
    modesetting.enable = true;
    open = true; # Usa el módulo de kernel open-source
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
        enableOffloadCmd = true;
      };
      # Bus IDs - Ajusta según tu hardware
      amdgpuBusId = "PCI:1:0:0";
      nvidiaBusId = "PCI:36:0:0";
    };
  };

  # Drivers de video para Xorg
  services.xserver.videoDrivers = [ "modesetting" "nvidia" ];
}
