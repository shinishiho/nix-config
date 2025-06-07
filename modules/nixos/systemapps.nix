{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    maple-mono.NF
    material-design-icons
    noto-fonts-cjk-sans
  ];

  # virtualisation.waydroid.enable = true;

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

  environment.systemPackages = [
    pkgs.portaudio
  ];
}
