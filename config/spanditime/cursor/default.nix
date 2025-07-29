{pkgs, ...}:
{
  programs.vscode = {
    enable = true;
    package = pkgs.code-cursor-fhs;
    extensions = with pkgs.vscode-extensions; [
      asvetliakov.vscode-neovim
      jnoortheen.nix-ide
    ];
# keybindings are handled primarily by the neovim 
  };
}
