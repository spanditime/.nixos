{config, pkgs, ...}:

let 
  cfgPath = ".config";
in
{
  programs = {
    git = {
      enable = true;
      aliases = {
        co = "checkout";
        blaame = "blame -w -C -C -C";
      };
      userName = "Frolov Eugene";
      userEmail = "spanditime@gmail.com";
      extraConfig = {
        push.autoSetupRemote = true;
      };
    };
    gh.enable = true;
  };
  home = {
    keyboard = {
      options = "grp:capslock_toggle";
    };
    packages = with pkgs;[
      remmina
      telegram-desktop
      mmex
      tym
    ];
    file = {
      "${cfgPath}/awesome" = {
        source = ./spanditime/awesome;
        recursive = true;
        enable = true;
      };
      "${cfgPath}/tym/config.lua" = {
        source = ./spanditime/tym/config.lua;
        enable = true;
      };
      "${cfgPath}/nvim" = {
        source = ./spanditime/nvim;
        recursive = true;
        enable = true;
      };
      "${cfgPath}/vifm" = {
        source = ./spanditime/vifm;
        recursive = true;
        enable = true;
      };
    };
  };
}
