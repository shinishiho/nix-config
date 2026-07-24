{
  programs.nixvim.plugins = {

    lsp = {
      enable = true;
      servers = {
        clangd = {
          enable = true;
          settings.compile_flags = "-std=c++20";
        };
        cmake.enable = true;
        nixd.enable = true;
        basedpyright.enable = true;
        ruff.enable = true;
        ts_ls.enable = true;
        lua_ls.enable = true;
        vale_ls.enable = true;
      };
    };

    lspkind.enable = true;
  };
}
