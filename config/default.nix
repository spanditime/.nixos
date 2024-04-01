{config, pkgs, ...}:

let 
  cfgPath = ".config";
in
{
  home = {
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
      "${cfgPath}/vimb" = {
        source = ./spanditime/vimb;
        recursive = true;
        enable = true;
      };
    };
  };
}
