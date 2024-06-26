{
  description = "NIXOS CONF";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim
  } @ inputs:
  let 
    user = "spanditime";
    location = "$HOME/.nixos";
  in{
    imports = [
      ./packages
    ];
    nixosConfigurations = import ./hosts {
      inherit inputs nixpkgs home-manager nixvim;
      inherit user location;
    };
  };
}
