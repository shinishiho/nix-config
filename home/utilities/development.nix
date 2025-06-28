_:
{
  programs = {
    # Development environment and data processing
    direnv = {
      enable = true;
      enableBashIntegration = true;
      enableZshIntegration = true;
      nix-direnv.enable = true;
    };

    jq = {
      enable = true;
    };
  };
}
