{ lib, inputs, nixpkgs, home-manager, user, location, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
}
