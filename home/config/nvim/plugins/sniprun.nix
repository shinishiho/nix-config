{
  programs.nixvim.plugins = {
    sniprun = {
      enable = true;
      settings = {
        display = [
          "NvimNotify"
        ];
        inline_messages = true;
        interpreter_options = {
          C_original = {
            compiler = "clang";
          };
          GFM_original = {
            use_on_filetypes = [
              "markdown.pandoc"
            ];
          };
          Python3_original = {
            error_truncate = "auto";
          };
        };
      };
    };
  };
}
