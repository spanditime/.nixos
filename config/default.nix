{config, pkgs, ...}:

let 
  cfgPath = ".config";
  colorscheme = import ./spanditime/colorschemes/measured-ligt.nix;
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
      "${cfgPath}/tym/config.lua" = {
        source = ./spanditime/tym/config.lua;
        enable = true;
      };
      "${cfgPath}/tym/theme.lua" = {
        enable = true;
        text = with colorscheme; ''
          local bg = '${base00}'
          local fg = '${base07}'
          return {
            color_background = bg,
            color_foreground = fg,
            color_bold = fg,
            color_cursor = fg,
            color_cursor_foreground = bg,
            color_highlight = fg,
            color_highlight_foreground = bg,
            color_0  = '${base08}',
            color_1  = '${base09}',
            color_2  = '${base0A}',
            color_3  = '${base0B}',
            color_4  = '${base0C}',
            color_5  = '${base0D}',
            color_6  = '${base0E}',
            color_7  = '${base0F}',
            color_8  = '${base08}',
            color_9  = '${base09}',
            color_10 = '${base0A}',
            color_11 = '${base0B}',
            color_12 = '${base0C}',
            color_13 = '${base0D}',
            color_14 = '${base0E}',
            color_15 = '${base0F}',
          }
        '';
      };
      "${cfgPath}/vifm" = {
        source = ./spanditime/vifm;
        recursive = true;
        enable = true;
      };
    };
  };
}
