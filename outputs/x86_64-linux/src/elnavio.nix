{
  inputs,
  lib,
  mylib,
  system,
  ...
}@args:
let
  username = "miguelagg";
  
  # Expand base/core modules at flake level to avoid circular dependency
  core-modules = mylib.scanPaths (mylib.relativeToRoot "home/base/core");

  modules = {
    nixos-modules = [
      (mylib.relativeToRoot "hosts/elnavio/configuration.nix")
      (mylib.relativeToRoot "hosts/elnavio/hardware-configuration.nix")
      (mylib.relativeToRoot "modules/default.nix")
      inputs.nixos-hardware.nixosModules.asus-fa507nv
      {
        # Overlay to add hytale-launcher to pkgs
        nixpkgs.overlays = [
          (final: prev: {
            hytale-launcher = inputs.hytale-launcher.packages.${system}.default;
          })
        ];
      }
      {
        # Install BOTH desktop environments
        # You'll choose which one at GDM login
        desktops.niri.enable = true;
        desktops.gnome.enable = true;
        desktops.hyprland.enable = false;  # Keep disabled for now
        desktops.kde.enable = false;
        
        services.displayManager.gdm.enable = true;
        
        # Enable gaming support
        modules.gaming.enable = true;
      }
    ];
    
        
    home-modules = [
      (mylib.relativeToRoot "hosts/elnavio/home.nix")
      # Main home-manager aggregator
      (mylib.relativeToRoot "home")

      # Desktop compositor (Linux-specific)
      (mylib.relativeToRoot "home/desktop/niri")

      {
        modules.desktop.niri.enable = true;
        modules.linux.wayland.enable = true;
      }
    ];
  };

in
{
  elnavio = mylib.nixosSystem (modules // args // { 
    inherit system username mylib;
    specialArgs = { inherit username; };
  });
}
