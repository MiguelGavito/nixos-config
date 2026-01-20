{
  inputs,
  system,
  lib,
  mylib,
  catppuccin,
  ...
}:
let
  username = "mariolo";
in
{
  elgaleon = inputs.nix-darwin.lib.darwinSystem {
    inherit system;
    specialArgs = { inherit username; };
    modules = [
      # Basic darwin config
      {
        system.stateVersion = 6;
        system.primaryUser = username;
        
        nix.settings = {
          experimental-features = [ "nix-command" "flakes" ];
          trusted-users = [ "@admin" username ];
        };
        
        users.users.${username} = {
          home = "/Users/${username}";
        };

        environment.systemPackages = with inputs.nixpkgs-darwin.legacyPackages.${system}; [
          vim
          git
        ];

        homebrew.enable = true;
      }

      # Home Manager
      inputs.home-manager.darwinModules.home-manager
      {
        home-manager = {
          # Provide extra arguments to all Home Manager modules
          extraSpecialArgs = {
            inherit mylib username catppuccin;
          };
          useGlobalPkgs = true;
          useUserPackages = true;
          users.${username} = {
            home.username = username;
            home.homeDirectory = "/Users/${username}";
            home.stateVersion = "25.11";
            programs.home-manager.enable = true;

            # Import macOS base HM and host-specific HM config
            imports = [
              ../../../home/darwin/default.nix
              ../../../hosts/elgaleon/home.nix
            ];

            # Git config (modern settings syntax)
            programs.git = {
              enable = true;
              settings.user = {
                name = "MiguelGavito";
                email = "mgavitogzz@gmail.com";
              };
            };
          };
        };
      }
    ];
  };
}
