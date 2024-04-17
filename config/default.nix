{config, pkgs, ...}:

let 
  cfgPath = ".config";
  colorscheme = import ./spanditime/colorschemes/atelier-dune-light.nix;
in
{
  _module.args = {
    inherit colorscheme;
  };
  imports = [
    ./spanditime/nvim
  ];
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
      "${cfgPath}/vifm" = {
        source = ./spanditime/vifm;
        recursive = true;
        enable = true;
      };
    };
  };
}
