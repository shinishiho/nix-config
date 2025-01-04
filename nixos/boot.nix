{ pkgs, ... }: {
  boot = {
    loader.systemd-boot.enable = true;
    loader.systemd-boot.consoleMode = "max";
    loader.efi.canTouchEfiVariables = true;
    initrd.systemd.enable = true;
    consoleLogLevel = 0;
    kernelPackages = pkgs.linuxPackages_xanmod_latest;
    kernelParams = [ "quiet" "udev.log_level=0" ];
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
