# Edit this configuration file to define what should be installed on
# your system. Help is available in the configuration.nix(5) man page, on
# https://search.nixos.org/options and in the NixOS manual (`nixos-help`).

{ config, lib, pkgs, user, hostName,  ... }:
{
  imports = [
    ../modules/services/pipewire.nix
  ]; 
  programs.fish.enable = true;
  users.users.${user} = {
    group = "users";
    extraGroups = [
      "wheel"
      "networkmanager"
      "video"
    ];
    isNormalUser = true;
    shell = pkgs.fish;
  };


   services = {
     displayManager = {
       sddm.enable = true;
       defaultSession = "none+awesome";
     };
  # Enable the X11 windowing system.
     xserver = {
      enable = true;
      xkb = {
        layout = "us,ru";
      };
      windowManager = {
        awesome = {
          enable = true;
          package = pkgs.awesome-git;
          luaModules = with pkgs.luaPackages; [
            luarocks
          ];
        };
      };
    
      libinput = {
        enable = true;
        touchpad = {
          horizontalScrolling = true;
          disableWhileTyping = true;
          naturalScrolling = true;
        };
      };
    };
  };


  environment.systemPackages = with pkgs; [
    vim
    man-pages
    man-pages-posix
    git
    killall
    vifm
    openvpn
    nix-prefetch-github
  ];

  fonts.packages = with pkgs; [
    nerdfonts
    jetbrains-mono
  ];
  
  # Enable CUPS to print documents.
  # services.printing.enable = true;

  networking = {
    hostName = hostName; # Define your hostname.
    networkmanager = {
      enable = true;  # Easiest to use and most distros use this by default.
      plugins = with pkgs; [
        networkmanager-openvpn
      ];
    };
    # Configure network proxy if necessary
    # proxy.default = "http://user:password@proxy:port/";
    # proxy.noProxy = "127.0.0.1,localhost,internal.domain";
    # Open ports in the firewall.
    # firewall.allowedTCPPorts = [ ... ];
    # firewall.allowedUDPPorts = [ ... ];
    # Or disable the firewall altogether.
    # firewall.enable = false;
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Set your time zone.
  time.timeZone = "Europe/Moscow";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  
  nix.settings.experimental-features = ["nix-command" "flakes"];

  # Copy the NixOS configuration file and link it from the resulting system
  # (/run/current-system/configuration.nix). This is useful in case you
  # accidentally delete configuration.nix.
  # system.copySystemConfiguration = true;

  # This option defines the first version of NixOS you have installed on this particular machine,
  # and is used to maintain compatibility with application data (e.g. databases) created on older NixOS versions.
  #
  # Most users should NEVER change this value after the initial install, for any reason,
  # even if you've upgraded your system to a new NixOS release.
  # This value does NOT affect the Nixpkgs version your packages and OS are pulled from,
  # so changing it will NOT upgrade your system.
  # This value being lower than the current NixOS release does NOT mean your system is
  # out of date, out of support, or vulnerable.
  # Do NOT change this value unless you have manually inspected all the changes it would make to your configuration,
  # and migrated your data accordingly.
  # For more information, see `man configuration.nix` or https://nixos.org/manual/nixos/stable/options#opt-system.stateVersion .
  system.stateVersion = "23.11"; # Did you read the comment?

}

