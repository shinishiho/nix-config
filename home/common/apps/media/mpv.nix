{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.my-apps.media.mpv;
  mpvScripts = with pkgs.mpvScripts; [
    uosc
    thumbfast
    sponsorblock
    quality-menu
  ] ++ optionals (!pkgs.stdenv.isDarwin) [
      mpris
    ];
in
  {
  options.my-apps.media.mpv = {
    enable = mkEnableOption "MPV Media Player";
  };

  config = mkIf cfg.enable {
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
        osd-bar = "no";
        border = "no";
        hwdec = "vaapi";
        vo = "gpu";
        ytdl-format = "bv[height=1080][vcodec^=av01]+ba/bv[height=1080][vcodec^=vp09]+ba/bv[height=1080]+ba/best";
        ytdl-raw-options = "sub-lang=\"en.*\",write-sub=,write-auto-sub=";
        force-window = "immediate";
      };
    };

    home.packages = with pkgs; [
      (ytfzf.override {
        mpv = mpv.override {
          scripts = mpvScripts;
        };
      })

      (ani-cli.override {
        mpv = mpv.override {
          scripts = mpvScripts;
        };
      })
    ];
  };
}
