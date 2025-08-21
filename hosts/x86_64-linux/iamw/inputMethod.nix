{
  pkgs,
  ...
}:

{
  i18n.inputMethod = {
    type = "fcitx5";
    enable = true;
    fcitx5 = {
      addons = with pkgs; [
        fcitx5-bamboo
        fcitx5-mozc
        fcitx5-gtk
      ];

      settings = {
        inputMethod = {
          "Groups/0" = {
            Name = "Default";
            "Default Layout" = "us";
            DefaultIM = "bamboo";
          };
          "Groups/0/Items/0" = {
            Name = "keyboard-us";
            Layout = "";
          };
          "Groups/0/Items/1" = {
            Name = "bamboo";
            Layout = "";
          };
          "Groups/0/Items/2" = {
            Name = "mozc";
            Layout = "";
          };
          "GroupOrder" = {
            "0" = "Default";
          };
        };
      };
    };
  };
}
