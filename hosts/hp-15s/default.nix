{ lib, inputs, nixpkgs, home-manager, user, location, ... }:
{
  imports = [
    ./hardware-configuration.nix
  ];
  hardware.enableAllFirmware = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
  };

  services.blueman.enable = true;
  programs = {
   steam = {
     enable = true;
   };
  };

  networking.networkmanager.wifi.powersave = false;

}
