{ inputs, config, pkgs, lib, platform, ... }: 

{
  imports = [
    # Home Manager Modules
    inputs.nixvim.homeManagerModules.default

    # Shared configurations (platform-agnostic)
    ./shared

    # Application modules
    ./apps/modules
  ] 
  # Linux-specific imports
  ++ lib.optionals (platform == "linux") [
    # Desktop Environments (Linux only)
    ./desktop/gnome
    ./desktop/labwc
    ./desktop/hyprland

    # Linux-specific configurations
    ./platforms/linux
  ]
  # Darwin-specific imports
  ++ lib.optionals (platform == "darwin") [
    # macOS-specific configurations
    ./platforms/darwin
  ];

  programs.home-manager.enable = true;
  
  home = {
    username = "w";
    homeDirectory = if platform == "linux" then "/home/w" else "/Users/w";
    stateVersion = "25.05";
  };
}
