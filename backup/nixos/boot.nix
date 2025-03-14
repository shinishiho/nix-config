{ pkgs, lib, ... }:
{
  boot = {
    loader.systemd-boot.enable = true;
    loader.systemd-boot.consoleMode = "max";
    loader.efi.canTouchEfiVariables = true;

    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxPackages_zen;

    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "udev.log_level=0"
    ];

    plymouth = {
      enable = true;
      theme = "circuit";
      themePackages = with pkgs; [
        (adi1090x-plymouth-themes.override {
          selected_themes = [ "circuit" ];
        })
      ];
    };
  };
}
