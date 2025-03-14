# Linux-specific home configurations
{ inputs, config, pkgs, ... }: {
  imports = [
    # Impermanence
    inputs.impermanence.homeManagerModules.impermanence

    # Add Linux-specific module imports here
    ./impermanence.nix
  ];

  # Linux-specific home configurations
  home.packages = with pkgs; [
    # Linux-specific packages
  ];

  # Linux-specific services and configurations
  services = {
    # Configure Linux-specific services here
  };

  # Add more Linux-specific configurations here
} 