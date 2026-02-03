{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.desktop.autoLogin;
  command = "uwsm start -- hyprland-uwsm.desktop";
in

{
  options.myModules.desktop.autoLogin = {
    enable = mkEnableOption "Auto-login with greetd";
    user = mkOption {
      type = types.str;
      default = "w";
      description = "User to automatically log in";
    };
  };

  config = mkIf cfg.enable {
    services = {
      greetd = {
        enable = true;
        settings = {
          initial_session = {
            command = "${command}";
            user = cfg.user;
          };
          default_session = {
            command = "${pkgs.tuigreet}/bin/tuigreet --greeting 'Welcome To NixOS' --asterisks --remember --remember-user-session --time --cmd '${command}'";
            user = "greeter";
          };
        };
      };
    };
  };
}
