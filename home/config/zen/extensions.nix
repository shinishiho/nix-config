{
  pkgs,
  ...
}:

{
  programs.zen-browser.profiles."Default (release)".extensions.packages = with pkgs.firefoxAddons; [
    darkreader
    dearrow
    enhancer-for-youtube
    languagetool
    minimalist-open-in-mpv
    multi-account-containers
    passff
    privacy-redirect
    proton-pass
    qr-code-address-bar
    sponsorblock
    turbo-download-manager
    ublock-origin
    user-agent-string-switcher
    video-downloadhelper
    vimium-ff
    youtube-recommended-videos
  ];

  programs.zen-browser.nativeMessagingHosts = with pkgs; [
    passff-host
  ];
}
