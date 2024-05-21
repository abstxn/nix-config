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
    hm-config = {
      home-manager.useGlobalPkgs = true;
      home-manager.useUserPackages = true;
      home-manager.users.abstxn = import ./home.nix;
    };
  in {
    nixosConfigurations.opus = lib.nixosSystem {
      inherit system;
      # specialArgs = { inherit inputs; };
      modules = [
        ./configuration.nix
        home-manager.nixosModules.home-manager hm-config
      ];
    };
  };
}
