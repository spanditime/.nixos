{
  description = "NIXOS CONF";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager
  } @ inputs:
  let 
    user = "spanditime";
    location = "$HOME/.nixos";
  in{
    imports = [
      ./packages
    ];
    nixosConfigurations = import ./hosts {
      inherit inputs nixpkgs home-manager;
      inherit user location;
    };
  };
}
