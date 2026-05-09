{
  config,
  lib,
  pkgs,
  ...
}:

{
  imports = [
    ./config/wallpaper
    ./config/zen

    ./config/kitty.nix
    ./config/mpv.nix
  ];

  home.packages = with pkgs; [
    (config.lib.nixGL.wrap localsend)

    # (config.lib.nixGL.wrap caprine)
    (config.lib.nixGL.wrap vesktop)
  ] ++ lib.optionals pkgs.stdenv.isLinux [
      gpu-screen-recorder-gtk
      (config.lib.nixGL.wrap parsec-bin)
    ] ++ lib.optionals pkgs.stdenv.isDarwin [
      stats
    ];

  services.gpg-agent.pinentry.package = lib.mkIf pkgs.stdenv.isLinux pkgs.pinentry-all;

  home.persistence."/persistent".directories = [
    ".parsec"
  ];
}
