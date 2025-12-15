{ config, pkgs, ... }:

{

  # Drivers for the Graphic card

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

  # Configure the NVIDIA driver
  hardware.nvidia = {
    modesetting.enable = true;
    open = true; # Use the open-source kernel module
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    prime = {
      offload = {
        enable = true;
	enableOffloadCmd = true;
      };
      # Use the Bus IDs
      amdgpuBusId = "PCI:1:0:0";
      nvidiaBusId = "PCI:36:0:0";
    };
  };

  # Load the nvidia driver for Xorg and Wayland
  services.xserver.videoDrivers = [ "modesetting" "nvidia"];

}