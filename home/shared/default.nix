# Shared home configurations (platform-agnostic)
{ inputs, config, pkgs, ... }: {
  imports = [
    # Terminal configurations (shared across platforms)
    ../terminal/shell
    ../terminal/tools
    ../terminal/nvim
    ../terminal/misc
    ../terminal/scripts
    
    # Applications (shared across platforms)
    ../apps
  ];

  # Add shared home configurations here
} 