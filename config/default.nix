{config, pkgs, ...}:

let 
  cfgPath = ".config";
in
{
  home = {
    keyboard = {
      options = "grp:capslock_toggle";
    };
    file = {
      "${cfgPath}/awesome" = {
        source = ./spanditime/awesome;
        recursive = true;
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
