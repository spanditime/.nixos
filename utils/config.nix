{
  defaultModules = {utils, inputs, pkgs, customPackages, lib, home-manager, user, location, hostName, standardConfig, ...}:[
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
            ../hosts/home.nix
            ../config
	  ];
	};
      };
    }
  ];
  wrapDefaultConfig = {utils, inputs, user, pkgs, lib, home-manager, location, hostName, modules, standardConfig, customPackages}:  lib.nixosSystem {
    specialArgs =  {
      inherit inputs pkgs user location hostName customPackages;
      host = {
        inherit hostName;
      };
    };
    modules = utils.config.defaultModules { inherit utils customPackages inputs pkgs home-manager user location lib hostName standardConfig; } ++ modules;
  };
}
