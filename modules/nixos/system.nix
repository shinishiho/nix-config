# Common system configuration for NixOS
{ pkgs, ... }:
{
  # Common hardware configuration
  # Host-specific hardware settings have been moved to host configuration

  # Common environment variables
  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  # Common services
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
      enable = false;
      package = pkgs.usbmuxd2;
    };
  };

  # Common security settings
  security.sudo = {
    execWheelOnly = true;
    wheelNeedsPassword = false;
    extraConfig = "Defaults pwfeedback";
  };

  # System state version is moved to host-specific configuration
}
