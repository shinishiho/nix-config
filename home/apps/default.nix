{ config, pkgs, ... }: {
  # Enable specific application modules
  chromium = {
    enable = true;
    flavor = pkgs.vivaldi;
  };
  cursor.enable = true;
  easyeffects.enable = true;
  firefox.enable = false;
  mpv.enable = true;
  obs.enable = false;
  thunderbird.enable = false;
  vscode.enable = false;
  zed.enable = true;

  # Other applications that don't have dedicated modules yet
  home.packages = with pkgs; [
    caprine
    gparted
    meld
    parsec-bin
    texliveBasic
  ];
}
