# Template configuration for Darwin hosts
{ lib, pkgs, inputs, ... }:

{
  imports = [
    # Import hardware configuration if needed
    # ./hardware-configuration.nix
  ];

  # Set your hostname
  networking.hostName = "darwin-hostname";

  # System-specific packages
  environment.systemPackages = with pkgs; [
    # Add Darwin-specific packages here
  ];

  # System-specific settings
  system = {
    # Configure macOS system settings here
    defaults = {
      NSGlobalDomain = {
        # Example: disable press-and-hold for keys in favor of key repeat
        ApplePressAndHoldEnabled = false;
      };
    };
  };

  # Add more Darwin-specific configuration here
} 