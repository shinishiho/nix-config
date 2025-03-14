{ config, pkgs, ... }: {
  # Enable specific application modules
  chromium = {
    enable = true;
    flavor = pkgs.vivaldi;
  };
  cursor.enable = true;
  easyeffects.enable = false;
  firefox.enable = false;
  mpv.enable = true;
  obs.enable = false;
  parsec.enable = true;
  thunderbird.enable = false;
  vscode.enable = false;
  zed.enable = true;

  programs.texlive = {
    enable = true;
    extraPackages = tpkgs: {
      inherit (tpkgs)
        collection-latexrecommended
        collection-fontsrecommended
        collection-fontsextra
        collection-langenglish
        collection-langjapanese;
    };
  };

  # Other applications that don't have dedicated modules yet
  home.packages = with pkgs; [
    gparted
    meld
  ];

  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = [ pkgs.fcitx5-bamboo ];
  };
}
