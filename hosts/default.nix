{ inputs, nixpkgs, home-manager, user, location, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
  };
  customPackages = import ../packages {inherit pkgs;};
  lib = nixpkgs.lib;
  standardConfig = import ./configuration.nix;
  utils = import ../utils;
  defaultAttributes = {
    inherit utils;
    inherit inputs pkgs customPackages lib home-manager;
    inherit user location;
    inherit standardConfig;
  };
in
{
  vm = utils.config.wrapDefaultConfig ({
    hostName = "vm";
    modules = [
      ./vm
    ];

  } // defaultAttributes);
}

