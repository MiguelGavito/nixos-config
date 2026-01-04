{
  description = "Nixos configuration of MiguelGavito";

  # check later for tutorial https://github.com/ryan4yin/nixos-and-flakes-book

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs = inputs: import ./outputs inputs;
}

