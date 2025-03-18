{
  description = "Leonardo Cerasi's nix configuration";

  inputs = {

    nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";

  };

  outputs = {

    nixosConfigurations = { self, nixpkgs, ... }:
      let
        lib = nixpkgs.lib;
      in {

      desktop = lib.nixosSystem {
        system = "x86_64-linux";
        modules = [ ./configuration.nix ];
      };

    };

  };
}
