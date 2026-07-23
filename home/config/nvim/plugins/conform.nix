{
  pkgs,
  ...
}:

{
  programs.nixvim.plugins.conform-nvim = {
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

      format_on_save = {
        timeout_ms = 5000;
        lsp_format = "fallback";
      };
    };
  };

  programs.nixvim.extraPackages = with pkgs; [
    ruff
    clang-tools
    prettierd
    prettier
    nixfmt
  ];
}
