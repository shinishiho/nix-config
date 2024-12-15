{
  programs.nixvim.plugins = {
    cmp = {
      enable = true;
      autoEnableSources = true;

      settings = {
        sources = [
        { name = "nvim_lsp"; }
        { name = "path"; }
        { name = "buffer"; }
        ];

        mapping = {
          "<C-b>" = "cmp.mapping.scroll_docs(-4)";
          "<C-f>" = "cmp.mapping.scroll_docs(4)";
          "<C-Space>" = "cmp.mapping.complete()";
          "<C-e>" = "cmp.mapping.abort()";
          "<Tab>" = "cmp.mapping(cmp.mapping.select_next_item(), {'i', 's'})";
          "<S-Tab>" = "cmp.mapping(cmp.mapping.select_prev_item(), {'i', 's'})";
          "<CR>" = "cmp.mapping.confirm({ select = false })";
        };

        snippet = {
          expand = "function(args) require('luasnip').lsp_expand(args.body) end";
        };

        formatting = {
          __raw = ''
            {
              format = require('lspkind').cmp_format({
                mode = 'symbol', -- show only symbol annotations
                maxwidth = 50, -- prevent the popup from showing more than provided characters (e.g 50 will not show more than 50 characters)
                -- can also be a function to dynamically calculate max width such as 
                -- maxwidth = function() return math.floor(0.45 * vim.o.columns) end,
                ellipsis_char = '...', -- when popup menu exceed maxwidth, the truncated part would show ellipsis_char instead (must define maxwidth first)
                show_labelDetails = true, -- show labelDetails in menu. Disabled by default

                -- The function below will be called before any actual modifications from lspkind
                -- so that you can provide more controls on popup customization. (See [#30](https://github.com/onsails/lspkind-nvim/pull/30))
                before = function (entry, vim_item)
                return vim_item
                end
                })
            }
          '';
        };

        sorting = {
          priority_weight = 2;
          comparators = [
            "cmp.config.compare.offset"
            "cmp.config.compare.exact"
            "cmp.config.compare.score"
            "cmp.config.compare.recently_used"
            "cmp.config.compare.locality"
            "cmp.config.compare.kind"
            "cmp.config.compare.sort_text"
            "cmp.config.compare.length"
            "cmp.config.compare.order"
          ];
        };

      };
    };

    lsp = {
      enable = true;
      servers = {
        clangd.enable = true;
        clangd.settings.compile_flags = "-std=c++20";
        cmake.enable = true;
        nixd.enable = true;
        pylyzer.enable = true;
        ruff.enable = true;
        ts_ls.enable = true;
        lua_ls.enable = true;
      };

      postConfig = ''
        require('lspconfig').verible.setup{
        cmd = {'verible-verilog-ls', '--rules_config_search'},
        singe_file_support = true,
        on_attach = _M.lspOnAttach,
        capabilities = __lspCapabilities(),
        }
      '';
    };

    lspkind.enable = true;
    cmp-nvim-lsp.enable = true;
  };
}
