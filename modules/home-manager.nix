{ config, lib, pkgs, ... }: {
  home = {
    # Add base home-manager configurations here
    packages = with pkgs; [
      # Add base packages that should be available across all platforms
    ];
  };
}
