{inputs, lib, pkgs, user, ...}:
{
  home = {
    username = user;
    homeDirectory = lib.mkForce "/home/${user}";
    stateVersion = "23.11"; 
    
    packages = with pkgs; [
      vimb-unwrapped
      neovim
      fzf
    ];
  };
}
