{
  pkgs,
  ...
}:

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

  home.packages = with pkgs; [
    gemini-cli
    pandoc
  ];
}
