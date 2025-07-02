{
  wayland.windowManager.hyprland.settings = {
    dwindle = {
      pseudotile = true;
      preserve_split = true;
    };

    master = {
      new_status = "master";
    };

    misc = {
      vrr = 0;
      disable_hyprland_logo = true;
      disable_splash_rendering = true;
      force_default_wallpaper = 0;
    };

    xwayland = {
      force_zero_scaling = true;
    };

    animations = {
      enabled = "yes";
      bezier = [
        "wind, 0.05, 0.9, 0.1, 1.05"
        "winIn, 0.1, 1.1, 0.1, 1.1"
        "winOut, 0.3, -0.3, 0, 1"
        "liner, 1, 1, 1, 1"
      ];

      animation = [
        "windows, 1, 6, wind, slide"
        "windowsIn, 1, 6, winIn, slide"
        "windowsOut, 1, 5, winOut, slide"
        "windowsMove, 1, 5, wind, slide"
        "border, 1, 1, liner"
        "borderangle, 1, 30, liner, loop"
        "fade, 1, 10, default"
        "workspaces, 1, 5, wind"
      ];
    };

    source = "~/.config/hypr/colors.conf";

    general = {
      gaps_in = 3;
      gaps_out = 8;
      border_size = 2;
      # "col.active_border" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
      # "col.inactive_border" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
      layout = "dwindle";
      resize_on_border = true;
    };

    # group = {
    #   "col.border_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
    #   "col.border_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
    #   "col.border_locked_active" = "rgba(ca9ee6ff) rgba(f2d5cfff) 45deg";
    #   "col.border_locked_inactive" = "rgba(b4befecc) rgba(6c7086cc) 45deg";
    # };

    decoration = {
      rounding = 10;
      shadow.enabled = false;

      blur = {
        enabled = true;
        size = 6;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = true;
        xray = false;
      };
    };

    windowrulev2 = [
      "opacity 0.90 0.90,class:^(firefox)$"
      "opacity 0.90 0.90,class:^(Brave-browser)$"
      "opacity 0.80 0.80,class:^(code-oss)$"
      "opacity 0.80 0.80,class:^(Code)$"
      "opacity 0.80 0.80,class:^(code-url-handler)$"
      "opacity 0.80 0.80,class:^(code-insiders-url-handler)$"
      "opacity 0.80 0.80,class:^(kitty)$"
      "opacity 0.80 0.80,class:^(org.kde.dolphin)$"
      "opacity 0.80 0.80,class:^(org.kde.ark)$"
      "opacity 0.80 0.80,class:^(nwg-look)$"
      "opacity 0.80 0.80,class:^(qt5ct)$"
      "opacity 0.80 0.80,class:^(qt6ct)$"
      "opacity 0.80 0.80,class:^(kvantummanager)$"
      "opacity 0.80 0.70,class:^(org.pulseaudio.pavucontrol)$"
      "opacity 0.80 0.70,class:^(blueman-manager)$"
      "opacity 0.80 0.70,class:^(nm-applet)$"
      "opacity 0.80 0.70,class:^(nm-connection-editor)$"
      "opacity 0.80 0.70,class:^(org.kde.polkit-kde-authentication-agent-1)$"
      "opacity 0.80 0.70,class:^(polkit-gnome-authentication-agent-1)$"
      "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.gtk)$"
      "opacity 0.80 0.70,class:^(org.freedesktop.impl.portal.desktop.hyprland)$"
      "opacity 0.70 0.70,class:^([Ss]team)$"
      "opacity 0.70 0.70,class:^(steamwebhelper)$"
      "opacity 0.70 0.70,class:^(Spotify)$"
      "opacity 0.70 0.70,initialTitle:^(Spotify Free)$"
      "opacity 0.90 0.90,class:^(com.github.rafostar.Clapper)$"
      "opacity 0.80 0.80,class:^(com.github.tchx84.Flatseal)$"
      "opacity 0.80 0.80,class:^(hu.kramo.Cartridges)$"
      "opacity 0.80 0.80,class:^(com.obsproject.Studio)$"
      "opacity 0.80 0.80,class:^(gnome-boxes)$"
      "opacity 0.80 0.80,class:^(discord)$"
      "opacity 0.80 0.80,class:^(WebCord)$"
      "opacity 0.80 0.80,class:^(ArmCord)$"
      "opacity 0.80 0.80,class:^(app.drey.Warp)$"
      "opacity 0.80 0.80,class:^(net.davidotek.pupgui2)$"
      "opacity 0.80 0.80,class:^(yad)$"
      "opacity 0.80 0.80,class:^(Signal)$"
      "opacity 0.80 0.80,class:^(io.github.alainm23.planify)$"
      "opacity 0.80 0.80,class:^(io.gitlab.theevilskeleton.Upscaler)$"
      "opacity 0.80 0.80,class:^(com.github.unrud.VideoDownloader)$"
      "opacity 0.80 0.80,class:^(io.gitlab.adhami3310.Impression)$"
      "opacity 0.80 0.80,class:^(io.missioncenter.MissionCenter)$"
      "opacity 0.80 0.80,class:^(io.github.flattool.Warehouse)$"
      "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
      "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
      "float,title:^(About Mozilla Firefox)$"
      "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
      "float,class:^(firefox)$,title:^(Library)$"
      "float,class:^(kitty)$,title:^(top)$"
      "float,class:^(kitty)$,title:^(btop)$"
      "float,class:^(kitty)$,title:^(htop)$"
      "float,class:^(vlc)$"
      "float,class:^(kvantummanager)$"
      "float,class:^(qt5ct)$"
      "float,class:^(qt6ct)$"
      "float,class:^(nwg-look)$"
      "float,class:^(org.kde.ark)$"
      "float,class:^(org.pulseaudio.pavucontrol)$"
      "float,class:^(blueman-manager)$"
      "float,class:^(nm-applet)$"
      "float,class:^(nm-connection-editor)$"
      "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
      "float,class:^(Signal)$"
      "float,class:^(com.github.rafostar.Clapper)$"
      "float,class:^(app.drey.Warp)$"
      "float,class:^(net.davidotek.pupgui2)$"
      "float,class:^(yad)$"
      "float,class:^(eog)$"
      "float,class:^(io.github.alainm23.planify)$"
      "float,class:^(io.gitlab.theevilskeleton.Upscaler)$"
      "float,class:^(com.github.unrud.VideoDownloader)$"
      "float,class:^(io.gitlab.adhami3310.Impression)$"
      "float,class:^(io.missioncenter.MissionCenter)$"
    ];

    layerrule = [
      "blur,rofi"
      "ignorezero,rofi"
      "blur,notifications"
      "ignorezero,notifications"
      "blur,swaync-notification-window"
      "ignorezero,swaync-notification-window"
      "blur,swaync-control-center"
      "ignorezero,swaync-control-center"
      "blur,logout_dialog"
    ];
  };
}
