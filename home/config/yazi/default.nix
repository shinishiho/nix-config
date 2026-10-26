{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    flavors = {
      catppuccin-mocha = ./catppuccin-mocha.yazi;
    };

    plugins = {
      relative-motions = ./relative-motions.yazi;
    };
  };
}
