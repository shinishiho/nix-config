{
  programs.nixvim.plugins.smartcolumn = {
    enable = true;
    settings = {
      colorcolumn = "100";
      custom_colorcolumn = {
        go = [
          "100"
          "130"
        ];
        java = [
          "100"
          "140"
        ];
        nix = [
          "100"
          "120"
        ];
        rust = [
          "80"
          "100"
        ];
      };
      disabled_filetypes = [
        "checkhealth"
        "help"
        "lspinfo"
        "markdown"
        "netrw"
        "noice"
        "text"
      ];
      scope = "window";
    };
  };
}
