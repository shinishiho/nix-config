{ pkgs, ... }:
{
  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    nerd-fonts.jetbrains-mono
    nerd-fonts.caskaydia-cove
    maple-mono-NF
    material-design-icons
    noto-fonts-cjk-sans
  ];

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
    zsh.enable = true;
    steam.enable = true;
  };

  environment.systemPackages = [
    pkgs.portaudio
  ];
}
