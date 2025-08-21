_:
{
  programs = {
    # Nix ecosystem tools
    nix-index-database.comma.enable = true;
    nix-index.enable = true;
    nh.enable = true;
  };

  home.sessionVariables = {
    NH_NO_CHECKS = "1"; # Darwin's using "Determinate System" requires this
  };
}
