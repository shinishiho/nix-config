{
  lib,
  pkgs,
  ...
}:

let
  ffExtension = with pkgs; [
    passff-host
    open-in-mpv
  ];
in

{
  programs.zen-browser.profiles."Default (release)".extensions.packages = with pkgs.firefoxAddons; [
    clearurls
    darkreader
    dearrow
    decentraleyes
    enhancer-for-youtube
    iina-open-in-mpv
    languagetool
    multi-account-containers
    passff
    privacy-redirect
    qr-code-address-bar
    sponsorblock
    ublock-origin
    user-agent-string-switcher
    video-downloadhelper
    vimium-ff
    youtube-recommended-videos
  ];

  # On Linux, pass through wrapFirefox (the only supported mechanism for zen on Linux).
  # On Darwin, wrapFirefox embeds store paths as strings into the wrapper binary which
  # triggers disallowedRequisites = [ stdenv.cc ] because passff-host's closure includes
  # clang-wrapper. Use the shared Mozilla NativeMessagingHosts path instead, which is
  # what the standard firefox HM module does and what all gecko browsers read on macOS.
  programs.zen-browser.nativeMessagingHosts = lib.optionals pkgs.stdenv.isLinux ffExtension;

  mozilla.firefoxNativeMessagingHosts = lib.optionals pkgs.stdenv.isDarwin ffExtension;
}
