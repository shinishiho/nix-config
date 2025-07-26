{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.myModules.services.keyd;
in
{
  options.myModules.services.keyd = {
    enable = mkEnableOption "Keyd configuration";
  };

  config = mkIf cfg.enable {
    services = {
      keyd = {
        enable = true;
        keyboards = {
          default = {
            ids = [ "*" ];
            settings = {
              main = {
                capslock = "overload(control, esc)";
              };
            };
          };
        };
      };
    };
  };
}
