{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      frecency.enable = true;
      fzf-native.enable = true;
    };

    keymaps = {
      "<leader>ff" = "find_files";
      "<leader>gf" = "git_files";
      "<leader>fb" = "buffers initial_mode=normal";
      "<leader>fs" = "live_grep";
      "<leader>sos" = "help_tags";
    };

    settings = {
      defaults = {
        layout_strategy = "flex";
        layout_config.prompt_position = "top";
        sorting_strategy = "ascending";
        winblend = 0;
      };
    };
  };
}
