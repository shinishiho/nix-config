{
  programs.nixvim.plugins.cloak = {
    enable = true;
    settings = {
      cloak_telescope = false;
      patterns = [
        {
          file_pattern = [
            ".env*"
            "wrangler.toml"
            ".dev.vars"
          ];
          cloak_pattern = "=.+";
        }
      ];
    };
  };
}
