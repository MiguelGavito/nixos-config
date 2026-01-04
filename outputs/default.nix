
{
  self,
  nixpkgs,
  ...
}@inputs:
let
  inherit (inputs.nixpkgs) lib;
  mylib = import ../lib { inherit lib; };
  
  # Arguments passed to all host definitions
  args = {
    inherit inputs lib mylib;
  };
  
  # Import system-specific outputs
  x86_64-linux = import ./x86_64-linux (args // { system = "x86_64-linux"; });
  
in
{
  # Merge all nixosConfigurations
  nixosConfigurations = x86_64-linux.nixosConfigurations or {};
  
  # Merge all homeConfigurations
  homeConfigurations = x86_64-linux.homeConfigurations or {};
}
