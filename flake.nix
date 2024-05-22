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
  };


  outputs = { self, nixpkgs, home-manager, ... } @ inputs:
  let
    inherit (nixpkgs) lib;
    system = "x86_64-linux";
  in {
    nixosConfigurations.opus = lib.nixosSystem {
      inherit system;
      specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.default
      ];
    };
  };
}
