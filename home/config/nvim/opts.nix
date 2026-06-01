{
  config,
  ...
}:

{
  programs.nixvim = {
    opts = {
      guicursor = "";
      mouse = "";

      number = true;
      relativenumber = true;

      tabstop = 2;
      softtabstop = 2;
      shiftwidth = 2;
      expandtab = true;

      smartindent = true;

      wrap = false;

      swapfile = false;
      backup = false;
      undodir = "${config.home.homeDirectory}/.vim/undodir";
      undofile = true;

      hlsearch = false;
      incsearch = true;

      termguicolors = true;

      scrolloff = 8;
      signcolumn = "yes";
      isfname = "@-@";

      updatetime = 50;

      cursorline = true;

      conceallevel = 0;
    };

    # files = {
    #   "after/ftplugin/cpp.lua" = {
    #     opts = {
    #       expandtab = true;
    #       shiftwidth = 4;
    #       softtabstop = 4;
    #       tabstop = 4;
    #     };
    #   };
    # };
  };
}
