{
  pkgs,
  ...
}:

{
  boot = {
    loader = {
      systemd-boot.enable = true;
      systemd-boot.consoleMode = "max";
      efi.canTouchEfiVariables = true;
    };

    initrd.systemd.enable = true;
    kernelPackages = pkgs.linuxPackages_zen;

    consoleLogLevel = 0;
    kernelParams = [
      "quiet"
      "udev.log_level=0"
    ];
  };
}
