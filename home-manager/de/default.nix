{ pkgs, ... }: {
  home.file.".icons/default".source = "${pkgs.bibata-cursors}/share/icons/Bibata-Modern-Classic";

  dconf = {
    enable = true;
    settings = {
      "org/gnome/shell" = {
        disable-user-extensions = false;
        enabled-extensions = with pkgs.gnomeExtensions; [
          blur-my-shell.extensionUuid
          gsconnect.extensionUuid
          tiling-assistant.extensionUuid
        ];
      };

      "org/gnome/desktop/interface".color-scheme = "prefer-dark";
    };
  };

  home.packages = with pkgs.gnomeExtensions; [
    blur-my-shell
    gsconnect
    tiling-assistant
  ];
}
