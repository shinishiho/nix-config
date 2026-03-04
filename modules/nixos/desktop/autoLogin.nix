{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.desktop.autoLogin;
in

{
  options.myModules.desktop.autoLogin = {
    enable = mkEnableOption "Auto-login with greetd";
    user = mkOption {
      type = types.str;
      description = "User to automatically log in";
    };
    command = mkOption {
      type = types.str;
      description = "Command to start";
    };
  };

  config = mkIf cfg.enable {
    services = {
      greetd = {
        enable = true;
        settings = {
          initial_session = {
            command = cfg.command;
            user = cfg.user;
          };
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --greeting 'Welcome To NixOS' --asterisks --remember --remember-user-session --time --cmd '${cfg.command}'";
            user = "greeter";
          };
        };
      };
    };
  };
}
