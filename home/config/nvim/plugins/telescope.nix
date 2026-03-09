{
  config,
  ...
}:

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

    luaConfig.pre = ''
local previewers = require("telescope.previewers")
local Job = require("plenary.job")
local new_maker = function(filepath, bufnr, opts)
  filepath = vim.fn.expand(filepath)
  Job:new({
    command = "file",
    args = { "--mime-type", "-b", filepath },
    on_exit = function(j)
      local mime_type = vim.split(j:result()[1], "/")[1]
      if mime_type == "text" then
        previewers.buffer_previewer_maker(filepath, bufnr, opts)
      else
        -- maybe we want to write something to the buffer here
        vim.schedule(function()
          vim.api.nvim_buf_set_lines(bufnr, 0, -1, false, { "BINARY" })
        end)
      end
    end
  }):sync()
end
    '';

    settings = {
      defaults = {
        layout_strategy = "flex";
        layout_config.prompt_position = "top";
        sorting_strategy = "ascending";
        winblend = 0;
        buffer_previewer_maker.__raw = "new_maker";
      };
    };
  };

  home.persistence."/persistent".files = [
    ".local/share/nvim/file_frecency.bin"
  ];
}
