{
  programs.nixvim.autoCmd = [
    {
      event = [ "BufReadCmd" ];
      pattern = [
        "*.mp3"
        "*.flac"
        "*.ogg"
        "*.wav"
        "*.m4a"
        "*.aac"
        "*.opus"
        "*.mp4"
        "*.mkv"
        "*.webm"
        "*.avi"
      ];
      callback.__raw = ''
        function(args)
          local file = args.file
          local prev_buf = vim.api.nvim_get_current_buf()

          local media_buf = vim.fn.bufnr(file)
          if media_buf ~= -1 then
            vim.api.nvim_buf_delete(media_buf, { force = true })
          end

          vim.cmd("enew")
          local term_buf = vim.api.nvim_get_current_buf()

          vim.fn.termopen({ "mpv", file }, {
            on_exit = function()
              if vim.api.nvim_buf_is_valid(prev_buf) then
                vim.api.nvim_set_current_buf(prev_buf)
              else
                vim.cmd("enew")
              end
              if vim.api.nvim_buf_is_valid(term_buf) then
                vim.api.nvim_buf_delete(term_buf, { force = true })
              end
              vim.schedule(function()
                require("telescope.builtin").find_files()
              end)
            end,
          })

          vim.schedule(function()
            vim.cmd("startinsert")
          end)
        end
      '';
    }
  ];
}
