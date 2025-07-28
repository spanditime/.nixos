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
    nur = {
      url = "github:nix-community/NUR";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };

  outputs = {
    self,
    nixpkgs,
    home-manager,
    nixvim,
    nur
  } @ inputs:
  let 
    user = "spanditime";
    location = "$HOME/.nixos";
  in{
    imports = [
      ./packages
    ];
    nixosConfigurations = import ./hosts {
      inherit inputs nixpkgs nur home-manager nixvim;
      inherit user location;
    };
  };
}
