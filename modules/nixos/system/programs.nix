{
  programs = {
    weylus = {
      enable = true;
      users = [ "w" ];
      openFirewall = true;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };

    adb.enable = true;
    fish.enable = true;
    steam.enable = true;
    fuse.userAllowOther = true;
  };
}
