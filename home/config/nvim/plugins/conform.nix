{
  pkgs,
  ...
}:

{
  programs.nixvim = {
    plugins.conform-nvim = {
      enable = true;

      settings = {
        formatters_by_ft = {
          python = [ "ruff_format" ];

          c = [ "clang-format" ];
          cpp = [ "clang-format" ];

          javascript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };

          javascriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };

          typescript = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };

          typescriptreact = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };

          markdown = {
            __unkeyed-1 = "prettierd";
            __unkeyed-2 = "prettier";
            stop_after_first = true;
          };

          nix = [ "nixfmt" ];

          "_" = [
            "trim_whitespace"
            "trim_newlines"
          ];
        };

        default_format_opts.lsp_format = "fallback";
      };
    };

    keymaps = [
      {
        mode = [
          "n"
          "x"
        ];
        key = "<leader>fo";
        action.__raw = ''
          function()
            require("conform").format({ async = true })
          end
        '';
        options.desc = "Format buffer or selection";
      }
      {
        mode = "n";
        key = "<leader>fi";
        action = "<cmd>ConformInfo<cr>";
        options.desc = "Show formatter info";
      }
    ];

    extraPackages = with pkgs; [
      ruff
      clang-tools
      prettierd
      prettier
      nixfmt
    ];
  };
}
