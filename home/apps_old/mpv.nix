{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:
{
  config = ({
    programs.mpv = {
      enable = true;
      scripts = with pkgs.mpvScripts; [
        uosc
        thumbfast
        sponsorblock
        quality-menu
        mpris
      ];
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
          scripts = with pkgs.mpvScripts; [
            uosc
            thumbfast
            sponsorblock
            quality-menu
            mpris
          ];
        };
      })

      (ani-cli.override {
        mpv = mpv.override {
          scripts = with pkgs.mpvScripts; [
            uosc
            thumbfast
            sponsorblock
            quality-menu
            mpris
          ];
        };
      })
    ];
  } // lib.optionalAttrs (platform == "linux") {
    home.persistence = {
      "/persistent/home/w" = {
        directories = [
          ".config/mpv"
        ];
      };
    };
  });
} 