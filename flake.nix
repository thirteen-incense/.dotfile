{
  description = "A very basic flake";

  inputs = {
    nixos.url = "nixpkgs/nixos-unstable";
    nixos-unstable.url = "nixpkgs/nixos-unstable";
    nixos-master.url = "nixpkgs/master";
    nixpkgs.url = "nixpkgs/master";
    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
    
    flake-utils.url = "github:numtide/flake-utils";
  };

  outputs = { nixpkgs, home-manager, ... }:
  let
    system = "x86_64-linux";
      
    pkgs = import nixpkgs {
      inherit system;
      config = { allowUnfree = true; };
    };

    lib = nixpkgs.lib;    

  in {
    homeManagerConfigurations = {
      Octo = home-manager.lib.homeManagerConfiguration {
        inherit system pkgs;
        username = "Octo";
        stateVersion = "21.11";
        homeDirectory = "/home/Octo";
        configuration = {
          imports = [
            ./home.nix
          ];
        };
      };
    };

    nixosConfigurations = {
      nixos = lib.nixosSystem {
        inherit system;
         
        modules = [
          ./system/configuration.nix
        ];
      };
    };
  };
}
