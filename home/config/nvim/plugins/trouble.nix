{
  # programs.nixvim.extraConfigLuaPost = ''
  #   local signs = { Error = " ", Warn = " ", Hint = "󰌵", Info = " " }
  #   for type, icon in pairs(signs) do
  #     local hl = "DiagnosticSign" .. type
  #     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
  #   end
  # '';
  programs.nixvim = {
    diagnostic.settings = {
      virtual_lines = true;
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
