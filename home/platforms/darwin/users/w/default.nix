{
  inputs,
  platform ? "darwin",
  ...
}:
{
  imports = [
    inputs.nixvim.homeManagerModules.default
    inputs.nix-index-database.hmModules.nix-index
    inputs.agenix.homeManagerModules.default

    # Shared configurations
    ../../../../home.nix
    
    # Applications and development tools
    # ../../../../apps/editors/zeditor
    ../../../../dev

    # Platform-specific applications
    ../../gaming/maa
  ];

  # Pass platform to all imported modules
  _module.args = { inherit platform; };

  programs.home-manager.enable = true;

  home = {
    username = "w";
    homeDirectory = "/Users/w";
    stateVersion = "25.11";
  };
}
