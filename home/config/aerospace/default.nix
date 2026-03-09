{
  pkgs,
  ...
}:

{
  imports = [
    ./settings.nix
    ./bindings.nix
    ./workspaces.nix
  ];

  programs.aerospace = {
    enable = true;
    launchd.enable = true;
  };
}
