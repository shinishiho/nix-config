{
  pkgs,
  ...
}:

let
  mpvScripts = with pkgs.mpvScripts; [
    mpris
    quality-menu
    sponsorblock
    thumbfast
    uosc
  ];
in
{
  programs.mpv = {
    enable = true;

    scripts = mpvScripts;
    scriptOpts = {
      thumbfast = {
        network = "yes";
        hwdec = "yes";
      };
    };
    config = {
      audio-display = "no";
      osd-bar = "no";
      border = "no";
      hwdec = "vaapi";
      gpu-context = "wayland";
      ytdl-format = "bv[height<=?1440]+ba/best";
      ytdl-raw-options = "sub-lang=\"en.*\",write-sub=,write-auto-sub=";
      # force-window = "immediate";
      input-ipc-server = "/tmp/mpvsocket";
      cache = "yes";
      cache-pause = "yes";
      cache-pause-wait = "1";
      cache-secs = "300";
      demuxer-max-bytes = "512MiB";
      demuxer-max-back-bytes = "512MiB";
      demuxer-readahead-secs = "120";
    };
    bindings = {
      "F" = "script-binding quality_menu/video_formats_toggle #! Stream Quality > Video";
      "Alt+f" = "script-binding quality_menu/audio_formats_toggle #! Stream Quality > Audio";
    };
  };

  home.packages = with pkgs; [
    (youtube-tui.override {
      mpv = mpv.override {
        scripts = mpvScripts;
      };
    })
  ];
}
