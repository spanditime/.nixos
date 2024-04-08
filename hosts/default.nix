{ inputs, nixpkgs, home-manager, user, location, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {overlays = [ (import ../packages) ]; inherit system;};
 # customPackages = import ../packages {inherit pkgs;};
  lib = nixpkgs.lib;
  defaultAttributes = {
    inherit pkgs inputs home-manager;
    inherit user location;
  };
  defaultModules = [
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = defaultAttributes;

        users.${user} = {
          imports = [
            ../hosts/home.nix
            ../config
	  ];
        };
      };
    }
  ];
in
{
  vm = lib.nixosSystem {
    inherit system;
    modules = [
      ./vm
      ./configuration.nix
    ] ++ defaultModules;
    specialArgs =  {
      host = {
        hostName = "vm";
      };
      hostName = "vm";
    } // defaultAttributes;
  };
  hp-15s = lib.nixosSystem {
    inherit system;
    modules = [
      ./hp-15s
      ./configuration.nix
    ] ++ defaultModules;
    specialArgs =  {
      host = {
        hostName = "hp-15s";
      };
      hostName = "hp-15s";
    } // defaultAttributes;
  };
}

