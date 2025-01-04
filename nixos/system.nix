{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-ocl
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    printing.enable = true;

    udev.extraRules = "KERNEL==\"uinput\", MODE=\"0660\", GROUP=\"uinput\", OPTIONS+=\"static_node=uinput\"'";

    usbmuxd = {
      enable = true;
      package = pkgs.usbmuxd2;
    };
  };

  security.sudo = {
    execWheelOnly = true;
    wheelNeedsPassword = false;
    extraConfig = "Defaults pwfeedback";
  };

  system.stateVersion = "unstable";
}
