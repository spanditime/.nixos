{config, pkgs, ...}:

let 
  cfgPath = ".config";
  colorscheme = import ./spanditime/colorschemes/gruvbox-material-light-medium.nix;
in
{
  _module.args = {
    inherit colorscheme cfgPath;
  };
  imports = [
    ./spanditime/nvim
    ./spanditime/Vieb
    ./spanditime/cursor
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
    ripgrep = {
      enable = true;
    };
    feh = {
      enable = true;
    };
  };
  services = {
    kdeconnect.enable = true;
    flameshot.enable = true;
  };
  home = {
    keyboard = {
      options = ["grp:alt_shift_toggle"] ;
    };
    packages = with pkgs;[
      # terminal
      tym

      blueberry
      nekoray

      telegram-desktop
      spotify
      nur.repos.vieb-nix.vieb
      
      prismlauncher

      krita
      inkscape
      blender
  
      # media
      mupdf
      vlc

      filezilla
      qbittorrent
      remmina


      # general dev tools - compilers ides, and tools daily used( tired of switching shells and stuff)
      go
      delve
      docker
      air

      godot_4

      vial

      zig

      freecad
      openscad
      openscad-lsp
      
      nodejs
      electron
      google-chrome
      yarn

      insomnia

      # sweet home
      sweethome3d.application
      sweethome3d.textures-editor
    ];
    file = {
      "${cfgPath}/awesome" = {
        source = ./spanditime/awesome;
        recursive = true;
        enable = true;
      };
      "${cfgPath}/awesome/themes/generated.lua" = {
        enable = true;
        text = ''
          return {
            flavour = "${colorscheme.flavour}",
            base00 = "${colorscheme.base00}",
            base01 = "${colorscheme.base01}",
            base02 = "${colorscheme.base02}",
            base03 = "${colorscheme.base03}",
            base04 = "${colorscheme.base04}",
            base05 = "${colorscheme.base05}",
            base06 = "${colorscheme.base06}",
            base07 = "${colorscheme.base07}",
            base08 = "${colorscheme.base08}",
            base09 = "${colorscheme.base09}",
            base0A = "${colorscheme.base0A}",
            base0B = "${colorscheme.base0B}",
            base0C = "${colorscheme.base0C}",
            base0D = "${colorscheme.base0D}",
            base0E = "${colorscheme.base0E}",
            base0F = "${colorscheme.base0F}",
            font   = "JetBrains Mono 12",
          }
        '';
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
