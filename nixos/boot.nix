{ pkgs, ... }: {
  boot = {
    loader.systemd-boot.enable = true;
    loader.systemd-boot.consoleMode = "max";
    loader.efi.canTouchEfiVariables = true;
    initrd.systemd.enable = true;
    consoleLogLevel = 0;
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

  systemd.services.display-manager = {
    description = "Display Manager";
    unitConfig = {
      Conflicts = "plymouth-quit.service";
      After = "plymouth-quit.service rc-local.service plymouth-start.service systemd-user-sessions.service";
      OnFailure = "plymouth-quit.service";
    };
    serviceConfig = {
      ExecStartPost = [
        "${pkgs.coreutils}/bin/sleep 30"
        "${pkgs.plymouth}/bin/plymouth quit --retain-splash"
      ];
    };
    wantedBy = [ "graphical.target" ];
  };
}
