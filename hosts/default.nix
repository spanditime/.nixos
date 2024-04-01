{ inputs, nixpkgs, home-manager, user, location, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
  };
  lib = nixpkgs.lib;
  standardConfig = import ./configuration.nix;
  utils = import ../utils;
  defaultAttributes = {
    inherit utils;
    inherit inputs pkgs lib home-manager;
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

