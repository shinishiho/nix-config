{
  programs.nixvim = {
    diagnostic.settings = {
      virtual_text = true;
      signs = {
        text.__raw = ''
          {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌵",
            [vim.diagnostic.severity.INFO] = "",
          }
        '';
      };
    };
    plugins = {
      trouble = {
        enable = true;
        # settings = {
        #
        # };
      };
    };
  };
}
