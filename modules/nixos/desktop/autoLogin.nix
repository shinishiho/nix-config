{
  pkgs,
  ...
}:

let
  command = "uwsm start -- hyprland-uwsm.desktop";
in

{
  services = {
    greetd = {
      enable = true;
      settings = {
        initial_session = {
          command = "${command}";
          user = "w";
        };
        default_session = {
          command = "${pkgs.tuigreet}/bin/tuigreet --greeting 'Welcome To NixOS' --asterisks --remember --remember-user-session --time --cmd ${command}";
          user = "greeter";
        };
      };
    };
  };
}
