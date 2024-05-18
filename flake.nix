{
description = "Default configuration for Opus";


inputs = {

  nixpkgs.url = "github:NixOS/nixpkgs/nixos-23.11";

  home-manager = {
    url = "github:nix-community/home-manager/release-23.11";
    inputs.nixpkgs.follows = "nixpkgs";
  };

};


outputs = { self, nixpkgs, home-manager, ... }@inputs: {

  nixosConfigurations.opus = nixpkgs.lib.nixosSystem {
    system = "x86_64-linux";
    specialArgs = { inherit inputs; };
    modules = [
      ./configuration.nix
      home-manager.nixosModules.home-manager {
          home-manager.useGlobalPkgs = true;
          home-manager.useUserPackages = true;
          home-manager.users.abstxn = import ./home.nix;
        }
    ];
  };

};


}
