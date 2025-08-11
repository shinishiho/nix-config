{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.gaming.maa;
in
{
  imports = lib.optionals (platform == "darwin") [
    ./launchd.nix
  ];

  options.my-apps.gaming.maa = {
    enable = mkEnableOption "MaaAssistantArknights";
  };

  config.home = mkIf cfg.enable ({
    packages = with pkgs; [
      maa-cli
    ];

    file = {
      ".config/maa/cli.toml".source = ./cli.toml;
      ".config/maa/tasks/daily.toml".source = ./daily.toml;
      ".config/maa/tasks/rock.toml".source = ./rock.toml;
      ".config/maa/profiles/default.toml".source = ./profile.toml;
      ".config/maa/resource/tasks.json".source = ./tasks.json;
      ".config/maa/infrast/252_4Gold.json".source = ./252_4Gold.json;
    };
  } // lib.optionalAttrs (platform == "linux") {
    persistence."/persistent/home/w".directories = [
      ".local/share/maa"
    ];
  });
}
