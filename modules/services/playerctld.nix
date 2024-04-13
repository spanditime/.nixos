{config, lib, pkgs, ...}:
with lib;
let
  cfg = config.services.playerctld;
in
{
  options.services.playerctld = {
    enable = lib.mkEnableOption (lib.mkDoc "enable playerctld");
    package = lib.mkPackageOption pkgs "playerctl" {};
  };
  
  config = mkIf cfg.enable {
    environment.systemPackages = [
      cfg.package
    ];
    systemd.user.services.playerctld = {
      description = "Playerctld daemon to track media player activity";
      wantedBy = [ "multi-user.target" ];

      serviceConfig = {
        Type = "exec";
        ExecStart = "${cfg.package}/bin/playerctld";
      };
    };
  };
}
