{ inputs, nixpkgs, home-manager, nixvim, user, location, ... }:

let
  system = "x86_64-linux";
  pkgs = import nixpkgs {overlays = [ (import ../packages) ]; inherit system; config.allowUnfree = true;};
 # customPackages = import ../packages {inherit pkgs;};
  lib = nixpkgs.lib;
  defaultAttributes = {
    inherit pkgs inputs home-manager nixvim;
    inherit user location;
  };
  defaultModules = [
    ../modules/programs/pamixer.nix
    ../modules/programs/light.nix
    home-manager.nixosModules.home-manager
    {
      home-manager = {
        useGlobalPkgs = true;
        useUserPackages = true;
        extraSpecialArgs = defaultAttributes;

        users.${user} = {
          imports = [
            nixvim.homeManagerModules.nixvim
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
      ../modules/services/upower.nix
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
  gmws = lib.nixosSystem {
    inherit system;
    modules = [
      ../modules/services/upower.nix
      ./gmws
      ./configuration.nix
    ] ++ defaultModules;
    specialArgs =  {
      host = {
        hostName = "gmws";
      };
      hostName = "gmws";
    } // defaultAttributes;
  };
}

