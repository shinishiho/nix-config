{
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

{
  imports = [
    ./thunderbird.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };

  home = ({
    packages = with pkgs; [
      caprine
      signal-desktop-bin
    ];
  } // lib.optionalAttrs (platform == "linux") {
    persistence."/persistent/home/w".directories = [
      ".config/Signal"
      ".config/Caprine"
    ];
  });
}
