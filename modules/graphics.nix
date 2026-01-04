{ config, lib, ... }:

{

  # Drivers for the Graphic card

  # Enable OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  };

 /*  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32 = true;
  }; */

  # Configure the NVIDIA driver
  hardware.nvidia = {
    modesetting.enable = true;
    open = false; # Use the open-source kernel module
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;

    # Power management for hybrid graphics
    powerManagement.enable = true;
    powerManagement.finegrained = true;

    prime = {
      offload = {
        enable = true;
	      enableOffloadCmd = true;
      };
      # Use the Bus IDs
      amdgpuBusId = lib.mkDefault "PCI:1:0:0";
      nvidiaBusId = lib.mkDefault "PCI:36:0:0";
    };
  };

  services.xserver.videoDrivers = [ "nvidia" ];
}
