{
  pkgs,
  ...
}:

{
  i18n.inputMethod = {
    type = "fcitx5";
    fcitx5 = {
      fcitx5-with-addons = pkgs.kdePackages.fcitx5-with-addons;
      addons = with pkgs; [
        fcitx5-bamboo
      ];

      waylandFrontend = true;
      settings = {

      };    
    };
  };

  # home.packages = with pkgs; [
  #   kdePackages.fcitx5-with-addons
  #   fcitx5-bamboo
  # ];
}