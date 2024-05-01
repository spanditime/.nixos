{ lib, inputs, nixpkgs, home-manager, user, location, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  hardware.bluetooth.enable = true;
  services.blueman.enable = true;
  networking.networkmanager.wifi.powersave = false;

}
