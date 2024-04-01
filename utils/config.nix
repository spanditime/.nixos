{
  defaultModules = {utils, inputs, pkgs, lib, home-manager, user, location, hostName, standardConfig, ...}:[
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
	  ];
	};
      };
    }
  ];
  wrapDefaultConfig = {utils, inputs, user, pkgs, lib, home-manager, location, hostName, modules, standardConfig}:  lib.nixosSystem {
    specialArgs =  {
      inherit inputs pkgs user location hostName;
      host = {
        inherit hostName;
      };
    };
    modules = utils.config.defaultModules { inherit utils inputs pkgs home-manager user location lib hostName standardConfig; } ++ modules;
  };
}
