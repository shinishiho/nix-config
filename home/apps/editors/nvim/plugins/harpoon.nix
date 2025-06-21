{
  programs.nixvim.plugins.harpoon = {
    enable = true;
    enableTelescope = true;
    keymaps = {
      addFile = "<leader>ha";
      toggleQuickMenu = "<leader>hs";
      navFile = {
        "1" = "<leader>a";
        "2" = "<leader>s";
        "3" = "<leader>d";
        "4" = "<leader>f";
      };
    };
  };
}
