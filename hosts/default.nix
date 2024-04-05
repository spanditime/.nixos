{ inputs, nixpkgs, home-manager, user, location, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
  };
 # customPackages = import ../packages {inherit pkgs;};
  lib = nixpkgs.lib;
  defaultAttributes = {
    inherit inputs pkgs home-manager;
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
    specialArgs =  {
      host = {
        hostName = "vm";
      };
      hostName = "vm";
    } // defaultAttributes;
    modules = [
      ./vm
      ./configuration.nix
    ] ++ defaultModules;
  };
}

