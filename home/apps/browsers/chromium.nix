{ config, lib, pkgs, platform ? "linux", ... }:

let
  inherit (lib) mkEnableOption mkIf optionalAttrs;
in
{
  options.chromium = {
    enable = mkEnableOption "Chromium configuration";
    flavor = lib.mkOption {
      type = lib.types.package;
      default = pkgs.chromium;
      description = "The Chromium-based browser package to use";
      example = "pkgs.ungoogled-chromium";
    };
  };

  config = mkIf config.chromium.enable ({
    programs.chromium = {
      enable = true;
      package = config.chromium.flavor;
    };
  } // optionalAttrs (platform == "linux") {
    home.persistence."/persistent/home/w" = {
      directories = [
        ".config/chromium"
      ];
    };
  });
}
