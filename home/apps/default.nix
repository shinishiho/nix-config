{
  pkgs,
  ...
}:
{
  imports = [
    ./modules
  ];

  chromium = {
    enable = true;
    flavor = pkgs.ungoogled-chromium;
  };
  cursor.enable = false;
  easyeffects.enable = false;
  firefox.enable = false;
  mpv.enable = true;
  obs.enable = false;
  parsec.enable = false;
  thunderbird.enable = false;
  vscode.enable = true;
  zed.enable = false;

  # Other applications that don't have dedicated modules yet
  home.packages = with pkgs; [
    gparted
    meld
    proton-pass
    signal-desktop
  ];

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = [ pkgs.fcitx5-bamboo ];
  };
}
