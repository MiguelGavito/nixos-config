
{
  description = "Nixos configuration of MiguelGavito";

  # check later for tutorial https://github.com/ryan4yin/nixos-and-flakes-book

  nixConfig = {
    extra-substituters = [ "https://noctalia.cachix.org" ];
    extra-trusted-public-keys = [ "noctalia.cachix.org-1:pCOR47nnMEo5thcxNDtzWpOxNFQsBRglJzxWPp3dkU4=" ];
  };

  inputs = {
    # Linux uses stable nixos branch
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.11";
    nixpkgs-unstable.url = "github:NixOS/nixpkgs/nixos-unstable";

    # macOS uses separate darwin branch
    nixpkgs-darwin.url = "github:NixOS/nixpkgs/nixpkgs-25.11-darwin";
    
    home-manager.url = "github:nix-community/home-manager/release-25.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # macOS support - follows darwin nixpkgs
    nix-darwin.url = "github:nix-darwin/nix-darwin/nix-darwin-25.11";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs-darwin";

    hyprland.url = "github:hyprwm/Hyprland";
    catppuccin = {
      url = "github:catppuccin/nix/release-25.11";
    };
    catppuccin-bat = {
      url = "github:catppuccin/bat";
      flake = false;
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    hytale-launcher.url = "github:JPyke3/hytale-launcher-nix";
    
    # desktop shell
    noctalia = {
      url = "github:noctalia-dev/noctalia/cachix";
      inputs.nixpkgs.follows = "nixpkgs";
    };  
    # noctalia-qs = {
    #   url = "github:noctalia-dev/noctalia-qs";
    #   inputs.nixpkgs.follows = "nixpkgs";
    # };
  };

  outputs = inputs: import ./outputs inputs;
}

