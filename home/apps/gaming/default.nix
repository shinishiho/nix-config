{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.gaming;
in
{
  imports = [
    ./maa
    ./streaming.nix
  ];

  options.my-apps.gaming.osu = {
    enable = mkEnableOption "osu! Lazer";
  };

  config.home = mkIf cfg.osu.enable ({
    packages = with pkgs; [
      osu-lazer-bin
    ];
  } // lib.optionalAttrs (platform == "linux") {
    persistence = {
      "/persistent/home/w" = {
        directories = [
          ".local/share/osu/files"
        ];
      };
    };
  });

  config = {
    # Pass platform to all imported modules
    _module.args = { inherit platform; };
  };
}
