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
    spotify-player = {
      enable = true;
    };
    ripgrep = {
      enable = true;
    };
    feh = {
      enable = true;
    };
    # monitor config
    autorandr = let 
      hdmi1f="00ffffffffffff00216d00270000000023210103803c217828ee91a3544c99260f505421080031404540614081c081809500b300a9c0565e00a0a0a029503020350055502100001a000000ff0030303030303030303030303031000000fd0030901fd73c000a202020202020000000fc0048444d490a202020202020202001e102033bf14a101f0413031201403f05230907078301000067030c0010003878681a000001013090e667d85dc401788000e305c000e60605016060005b9d00a0a0a029503020350000000000001a70c200a0a0a055503020350000000000001e97e200a0a0a029503020350000000000001a000000000000000000000000000019";
      edp1f="00ffffffffffff0006afed2100000000001c010495221378036e8593585892281e505400000001010101010101010101010101010101143780b4703826406c30aa0058c210000018b82480b4703826406c30aa0058c21000001800000000000000000000000000000000000000000002001040ff0f3c7d0f13287d2020200020";
      eDPconf = {
        enable = true;
        mode = "1920x1080";
        rotate = "normal";
      };
    in {
      enable = true;
      profiles = {
        "single" = {
          fingerprint={
            eDP-1=edp1f;
          };
          config = {
            eDP-1 = eDPconf // {
              primary = true;
            };
          };
        };
        "external" = {
          fingerprint = {
            eDP-1=edp1f;
            HDMI-1=hdmi1f;
          };
          config={
            eDP-1.enable = false;
            HDMI-1={
              enable = true;
              primary = true;
              mode="2560x1440";
              rate="144";
              rotate="normal";
            };
          };
        };
        "codesetup" = {
          fingerprint = {
            eDP-1=edp1f;
            HDMI-1=hdmi1f;
          };
          config={
            eDP-1 = eDPconf;
            HDMI-1={
              enable = true;
              primary = true;
              mode="2560x1440";
              rate="144";
              rotate="right";
              position="1980x0";
            };
          };
        };
        "both" = {
          fingerprint = {
            eDP-1=edp1f;
            HDMI-1=hdmi1f;
          };
          config={
            eDP-1 = eDPconf;
            HDMI-1={
              enable = true;
              primary = true;
              mode="2560x1440";
              rate="144";
              rotate="normal";
              position="1980x0";
            };
          };
        };
      };
    };
  };
  services = {
    flameshot.enable = true;
    autorandr.enable = true;
  };
  home = {
    keyboard = {
      options = ["grp:alt_shift_toggle"] ;
    };
    packages = with pkgs;[
      blueberry
      # lychee-slicer
      nekoray
      
      prismlauncher

      krita
      inkscape
      spotify

      filezilla
      gparted
      anydesk
      remmina
      mattermost-desktop
      telegram-desktop

      mupdf

      vial
      insomnia

      # general dev tools - compilers ides, and tools daily used( tired of switching shells and stuff)
      delve
      docker
      tym
      zig
      go
      nodejs
      yarn
      air

      freecad
      openscad
      openscad-lsp
      
      # dev tools needed
      electron
      google-chrome


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
