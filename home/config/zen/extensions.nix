{
  pkgs,
  ...
}:

{
  programs.zen-browser.profiles.default.extensions.packages = with pkgs.firefoxAddons; [
    clearurls
    darkreader
    dearrow
    enhancer-for-youtube
    iina-open-in-mpv
    languagetool
    libredirect
    localcdn-fork-of-decentraleyes
    multi-account-containers
    passff
    qr-code-address-bar
    sponsorblock
    ublock-origin
    user-agent-string-switcher
    video-downloadhelper
    vimium-ff
    youtube-recommended-videos
  ];

  programs.zen-browser.nativeMessagingHosts = with pkgs; [
    passff-host
    open-in-mpv
  ];
}
