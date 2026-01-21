{
  self,
  nixpkgs,
  ...
} @ inputs: let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib {inherit lib;};

  # Arguments passed to all host definitions
  args = {
    inherit inputs lib mylib;
    catppuccin = inputs.catppuccin;
    noctalia = inputs.noctalia;
  };

  # Import system-specific outputs
  x86_64-linux = import ./x86_64-linux (args // {system = "x86_64-linux";});
  aarch64-darwin = import ./aarch64-darwin (args // {system = "aarch64-darwin";});
in {
  # Merge all nixosConfigurations (Linux)
  nixosConfigurations = x86_64-linux.nixosConfigurations or {};

  # Merge all darwinConfigurations (macOS)
  darwinConfigurations = aarch64-darwin.darwinConfigurations or {};

  # Merge all homeConfigurations
  homeConfigurations = 
    (x86_64-linux.homeConfigurations or {}) //
    (aarch64-darwin.homeConfigurations or {});
}
