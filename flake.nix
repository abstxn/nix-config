{
  description = "Default configuration for Opus";

  inputs = {

    # Nixpkgs
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-unstable";

    # Home Manager
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    # Hardware Presets
    hardware.url = "github:nixos/nixos-hardware";
  };


  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  let
    inherit (nixpkgs) lib;
    system = "x86_64-linux";
  in {

    nixosConfigurations = {

      opus = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/opus
          home-manager.nixosModules.default
        ];
      };

      opal = lib.nixosSystem {
        inherit system;
        specialArgs = { inherit inputs; };
        modules = [
          ./hosts/opal
          home-manager.nixosModules.default
        ];
      };
    };
  };
}
