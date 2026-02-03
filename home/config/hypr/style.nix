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
      enabled = false;
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
        enabled = false;
        size = 6;
        passes = 3;
        new_optimizations = true;
        ignore_opacity = true;
        xray = false;
      };
    };

    windowrule = [
      "match:class [W|w]aydroid.*, fullscreen on"
      "match:title BongoCat, no_blur on"
      "match:title BongoCat, no_shadow on"
      "match:title BongoCat, float on"
      "match:title BongoCat, pin on"
      "match:title BongoCat, no_focus on"
      "match:title BongoCat, suppress_event fullscreen maximize"
      # "float,class:^(org.kde.dolphin)$,title:^(Progress Dialog — Dolphin)$"
      # "float,class:^(org.kde.dolphin)$,title:^(Copying — Dolphin)$"
      # "float,title:^(About Mozilla Firefox)$"
      # "float,class:^(firefox)$,title:^(Picture-in-Picture)$"
      # "float,class:^(firefox)$,title:^(Library)$"
      # "float,class:^(kitty)$,title:^(top)$"
      # "float,class:^(kitty)$,title:^(btop)$"
      # "float,class:^(kitty)$,title:^(htop)$"
      # "float,class:^(vlc)$"
      # "float,class:^(kvantummanager)$"
      # "float,class:^(qt5ct)$"
      # "float,class:^(qt6ct)$"
      # "float,class:^(nwg-look)$"
      # "float,class:^(org.kde.ark)$"
      # "float,class:^(org.pulseaudio.pavucontrol)$"
      # "float,class:^(blueman-manager)$"
      # "float,class:^(nm-applet)$"
      # "float,class:^(nm-connection-editor)$"
      # "float,class:^(org.kde.polkit-kde-authentication-agent-1)$"
      # "float,class:^(Signal)$"
      # "float,class:^(com.github.rafostar.Clapper)$"
      # "float,class:^(app.drey.Warp)$"
      # "float,class:^(net.davidotek.pupgui2)$"
      # "float,class:^(yad)$"
      # "float,class:^(eog)$"
      # "float,class:^(io.github.alainm23.planify)$"
      # "float,class:^(io.gitlab.theevilskeleton.Upscaler)$"
      # "float,class:^(com.github.unrud.VideoDownloader)$"
      # "float,class:^(io.gitlab.adhami3310.Impression)$"
      # "float,class:^(io.missioncenter.MissionCenter)$"
    ];

    layerrule = [
      "match:namespace rofi, blur ignore_alpha"
      "match:namespace notifications, blur ignore_alpha"
      # "blur,rofi"
      # "ignorezero,rofi"
      # "blur,notifications"
      # "ignorezero,notifications"
      # "blur,swaync-notification-window"
      # "ignorezero,swaync-notification-window"
      # "blur,swaync-control-center"
      # "ignorezero,swaync-control-center"
      # "blur,logout_dialog"
    ];
  };
}
