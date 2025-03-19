{
  description = "Leonardo Cerasi's nix configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
    home-manager = {
      url = "github:nix-community/home-manager/release-24.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = { self, nixpkgs, home-manager, ... }:
    let
      system = "x86_64-linux";
      lib = nixpkgs.lib;
      pkgs = nixpkgs.legacyPackages.${system};
    in {

    nixosConfigurations = {

      desktop = lib.nixosSystem {
        inherit system;
        modules = [ ./system/configuration.nix ];
      };

    };

    homeConfigurations = {

      leonardo = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;
        modules = [ ./user/leonardo.nix ];
      };

    };

  };
}
