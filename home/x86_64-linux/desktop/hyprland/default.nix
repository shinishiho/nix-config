{
  config,
  pkgs,
  ...
}:
{
  imports = [
    ./hypr
    ./hyprpanel.nix
    ./rofi.nix
    ./wallust.nix
  ];

  home.pointerCursor = {
    gtk.enable = true;
    package = pkgs.bibata-cursors;
    name = "Bibata-Modern-Classic";
    size = 25;
  };

  home.packages = with pkgs; [
    grim
    grimblast
    slurp
    swappy
    # swww
    wf-recorder
    wl-clipboard
  ];

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
  };

  xdg.configFile."uwsm/env".source = "${config.home.sessionVariablesPackage}/etc/profile.d/hm-session-vars.sh"; 
}
