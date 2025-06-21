{ config, lib, pkgs, platform ? "linux", ... }:

let
  inherit (lib) mkEnableOption mkIf;
  
  mpvScripts = with pkgs.mpvScripts; [
    uosc
    thumbfast
    sponsorblock
    quality-menu
    mpris
  ];
  mpvScriptOpts = {
    thumbfast = {
      network = "yes";
      hwdec = "yes";
    };
  };
  mpvConfig = {
    osd-bar = "no";
    border = "no";
    hwdec = "vaapi";
    vo = "gpu";
    ytdl-format = "bv[height=1080][vcodec^=av01]+ba/bv[height=1080][vcodec^=vp09]+ba/bv[height=1080]+ba/best";
    ytdl-raw-options = "sub-lang=\"en.*\",write-sub=,write-auto-sub=";
    force-window = "immediate";
  };
in
{
  options.mpv = {
    enable = mkEnableOption "MPV configuration";
  };

  config = mkIf config.mpv.enable {
    programs.mpv = {
      enable = true;
      scripts = mpvScripts;
      scriptOpts = mpvScriptOpts;
      config = mpvConfig;
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