{inputs, lib, pkgs, user, ...}:
{
  home = {
    username = user;
    homeDirectory = lib.mkForce "/home/${user}";
    stateVersion = "23.11"; 
  };
}
