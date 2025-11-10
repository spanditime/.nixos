{pkgs, ...}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.cursor-appimage;
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      jnoortheen.nix-ide
      # willasm.obsidian-md-vsc
    ];
# keybindings are handled primarily by the neovim 
  };
}
