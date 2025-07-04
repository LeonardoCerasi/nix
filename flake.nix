{
  description = "Leonardo Cerasi's NixOS configuration";

  inputs = {
    nixpkgs.url = "github:NixOS/nixpkgs/nixos-25.05";

    home-manager = {
      url = "github:nix-community/home-manager/release-25.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = inputs@{ self, nixpkgs, home-manager, ... }:
  let
    nix-version = "25.05";
    system = "x86_64-linux";
    lib = nixpkgs.lib;
    pkgs = nixpkgs.legacyPackages.${system};
  in {

    nixosConfigurations = {

      # host: desktop
      desktop = lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit nix-version;
        };

        modules = [
          ./hosts/desktop/configuration.nix
        ];
      };

      # host: laptop
      laptop = lib.nixosSystem {
        inherit system;

        specialArgs = {
          inherit nix-version;
        };

        modules = [
          ./hosts/laptop/configuration.nix
        ];
      };
    };

    homeConfigurations = {

      # user: leonardo@desktop
      leonardo-desktop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit nix-version;
        };

        modules = [
          ./users/leonardo-desktop/home.nix
        ];
      };

      # user: leonardo@laptop
      leonardo-laptop = home-manager.lib.homeManagerConfiguration {
        inherit pkgs;

        extraSpecialArgs = {
          inherit nix-version;
        };

        modules = [
          ./users/leonardo-laptop/home.nix
        ];
      };
    };
  };
}
