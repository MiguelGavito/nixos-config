{
  inputs,
  lib,
  mylib,
  system,
  ...
}@args:
let
  username = "miguelagg";
  
  modules = {
    nixos-modules = [
      (mylib.relativeToRoot "hosts/elnavio/configuration.nix")
      (mylib.relativeToRoot "hosts/elnavio/hardware-configuration.nix")
      (mylib.relativeToRoot "modules/default.nix")
      inputs.nixos-hardware.nixosModules.asus-fa507nv
      {
        # Install BOTH desktop environments
        # You'll choose which one at GDM login
        desktops.niri.enable = true;
        desktops.gnome.enable = true;
        desktops.hyprland.enable = false;  # Keep disabled for now
        desktops.kde.enable = false;
        
        services.displayManager.gdm.enable = true;
      }
    ];
    
    home-modules = [
      (mylib.relativeToRoot "hosts/elnavio/home.nix")
      (mylib.relativeToRoot "home/default.nix")
      # Import desktop configs - each defines its own module option
      (mylib.relativeToRoot "home/desktop/niri")
      # Uncomment for other desktops:
      # (mylib.relativeToRoot "home/desktop/hyprland")
      {
        # Enable Niri as primary desktop
        modules.desktop.niri.enable = true;
        # modules.desktop.hyprland.enable = true;  # Uncomment for Hyprland
      }
    ];
  };

in
{
  elnavio = mylib.nixosSystem (modules // args // { 
    inherit system username;
    specialArgs = { inherit username; };
  });
}
