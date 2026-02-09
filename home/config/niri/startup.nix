{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.niri.settings = {
    # Startup applications
    spawn-at-startup = [
      { command = [ "/usr/lib/polkit-kde-authentication-agent-1" ]; }
    ];
  };
}
