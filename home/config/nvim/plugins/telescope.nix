{
  programs.nixvim.plugins.telescope = {
    enable = true;
    extensions = {
      frecency.enable = true;
      fzf-native.enable = true;
    };

    settings = {
      defaults = {
        layout_strategy = "flex";
        layout_config.prompt_position = "top";
        sorting_strategy = "ascending";
        winblend = 0;
        vimgrep_arguments = [
          "rg"
          "--color=never"
          "--no-heading"
          "--with-filename"
          "--line-number"
          "--column"
          "--smart-case"
          "--hidden"
          "--glob"
          "!.git"
        ];
      };
      pickers.find_files.find_command = [
        "rg"
        "--files"
        "--hidden"
        "--glob"
        "!.git"
      ];
    };
  };

  programs.nixvim.keymaps = [
    {
      mode = "n";
      key = "<leader>ff";
      action = "<cmd>Telescope find_files<cr>";
      options.desc = "Find files";
    }
    {
      mode = "n";
      key = "<leader>gf";
      action = "<cmd>Telescope git_files<cr>";
      options.desc = "Find Git files";
    }
    {
      mode = "n";
      key = "<leader>fb";
      action = "<cmd>Telescope buffers initial_mode=normal<cr>";
      options.desc = "Find buffers";
    }
    {
      mode = "n";
      key = "<leader>fs";
      action = "<cmd>Telescope live_grep<cr>";
      options.desc = "Search files";
    }
    {
      mode = "n";
      key = "<leader>sos";
      action = "<cmd>Telescope help_tags<cr>";
      options.desc = "Search help";
    }
    {
      mode = "n";
      key = "<leader>fd";
      action = "<cmd>Telescope diagnostics<cr>";
      options.desc = "Find diagnostics";
    }
    {
      mode = "n";
      key = "<leader>fk";
      action = "<cmd>Telescope keymaps<cr>";
      options.desc = "Find keymaps";
    }
  ];

  home.persistence."/persistent".files = [
    ".local/share/nvim/file_frecency.bin"
  ];
}
