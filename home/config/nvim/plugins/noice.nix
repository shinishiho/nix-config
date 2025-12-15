{
  programs.nixvim.plugins = {
    noice = {
      enable = true;

      settings = {

        presets = {
          bottom_search = true;
          command_palette = false;
          inc_rename = false;
          long_message_to_split = true;
          lsp_doc_border = false;
        };

        lsp.override = {
          "cmp.entry.get_documentation" = true;
          "vim.lsp.util.convert_input_to_markdown_lines" = true;
          "vim.lsp.util.stylize_markdown" = true;
        };

        views = {
          cmdline_popup = {
            position = "50%";
            size = {
              width = 60;
              height = "auto";
            };
          };
          popupmenu = {
            anchor = "SW";
            relative = "editor";
            position = {
              row = "54%";
              col = "50%";
            };
            size = {
              width = 60;
              height = "auto";
              max_height = 15;
            };
            border = {
              style = "rounded";
              padding = [
                0
                1
              ];
            };
            win_options = {
              winhighlight = {
                Normal = "Normal";
                FloatBorder = "DiagnosticInfo";
              };
            };
          };
        };

      };
    };

    notify = {
      enable = true;
      settings.background_colour = "#000000";
    };
  };
}
