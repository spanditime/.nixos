{ inputs, nixpkgs, home-manager, user, location, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {
    inherit system;
  };
  lib = nixpkgs.lib;

  standardConfig = import ./configuration.nix;
  defaultModules = {inputs, pkgs, lib, home-manager, user, location, hostName, ...}:[
    (standardConfig)
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = {
	  inherit inputs pkgs user;
	  host = {
	    hostName = hostName;
	  };
	};
	users.${user} = {
          imports = [
            ./home.nix
	  ];
	};
      };
    }
  ];

  wrapDefaultConfig = { user, pkgs, lib, location, hostName, modules}:  lib.nixosSystem {
    specialArgs =  {
      inherit inputs pkgs user location hostName;
      host = {
        inherit hostName;
      };
    };
    modules = defaultModules { inherit inputs pkgs home-manager user location lib hostName; } ++ modules;
  };
in
{
  vm = wrapDefaultConfig {
    inherit user location;
    inherit pkgs lib;
    hostName = "vm";
    modules = [
      ./vm
    ];
  };
}

