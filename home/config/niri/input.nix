{
  inputs,
  pkgs,
  lib,
  config,
  ...
}:

{
  programs.niri.settings = {
    # Input configuration
    input = {
      keyboard = {
        xkb = {
          layout = "us";
        };
        numlock = true;
      };

      touchpad = {
        tap = true;
        natural-scroll = true;
      };

      focus-follows-mouse = {
        max-scroll-amount = "25%";
      };
    };
  };
}
