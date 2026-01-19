{
  inputs,
  lib,
  mylib,
  system,
  ...
}@args:
let
  username = "miguel";  # Cambia esto a tu usuario de macOS
  
  modules = {
    darwin-modules = [
      # Darwin system configuration
      # Add homebrew, system settings, etc here
      {
        # System configuration
        system.stateVersion = 5;
        
        # Enable Nix daemon
        services.nix-daemon.enable = true;
        
        # Nix settings
        nix = {
          settings = {
            experimental-features = [ "nix-command" "flakes" ];
            trusted-users = [ "@admin" username ];
          };
          
          # Garbage collection
          gc = {
            automatic = true;
            interval = { Weekday = 0; Hour = 2; Minute = 0; };
            options = "--delete-older-than 30d";
          };
        };
        
        # macOS system defaults
        system.defaults = {
          dock = {
            autohide = true;
            orientation = "bottom";
            show-recents = false;
            tilesize = 48;
          };
          
          finder = {
            AppleShowAllExtensions = true;
            FXEnableExtensionChangeWarning = false;
            QuitMenuItem = true;
          };
          
          NSGlobalDomain = {
            AppleInterfaceStyle = "Dark";
            AppleShowAllExtensions = true;
            "com.apple.swipescrolldirection" = false;  # Natural scrolling off
            InitialKeyRepeat = 15;
            KeyRepeat = 2;
          };
        };
        
        # Fonts
        fonts.packages = with inputs.nixpkgs.legacyPackages.${system}; [
          (nerdfonts.override { fonts = [ "JetBrainsMono" ]; })
        ];
        
        # Homebrew (optional - for apps not in nixpkgs)
        homebrew = {
          enable = true;
          onActivation = {
            autoUpdate = true;
            cleanup = "zap";
          };
          
          # Formulae (CLI tools)
          brews = [
            # Add CLI tools not in nixpkgs
          ];
          
          # Casks (GUI apps)
          casks = [
            # Recommended macOS apps
            # "rectangle"  # Window manager
            # "raycast"    # Spotlight replacement
            # "iterm2"     # Terminal (or use kitty from nix)
          ];
          
          # Mac App Store apps
          masApps = {
            # "Xcode" = 497799835;
          };
        };
      }
    ];
    
    home-modules = [
      (mylib.relativeToRoot "hosts/macbookair/home.nix")
      # Import darwin home config (includes base)
      (mylib.relativeToRoot "home/darwin")
      
      {
        # Home Manager specific settings for macOS
        home = {
          inherit username;
          homeDirectory = "/Users/${username}";
        };
      }
    ];
  };

in
{
  macbookair = inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = inputs // args // { inherit username mylib; };
    
    modules = modules.darwin-modules ++ [
      inputs.home-manager.darwinModules.home-manager
      {
        home-manager = {
          useGlobalPkgs = true;
          useUserPackages = true;
          extraSpecialArgs = inputs // args // { inherit username mylib; };
          users.${username}.imports = modules.home-modules;
        };
      }
    ];
  };
}
