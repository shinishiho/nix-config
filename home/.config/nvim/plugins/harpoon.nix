{
  programs.nixvim = {
    plugins.harpoon = {
      enable = true;
      enableTelescope = true;
    };

    keymaps = [
      { mode = "n"; key = "<leader>ha"; action.__raw = "function() require'harpoon':list():add() end"; }
      { mode = "n"; key = "<leader>hs"; action.__raw = "function() require'harpoon'.ui:toggle_quick_menu(require'harpoon':list()) end"; }
      { mode = "n"; key = "<M-h>"; action.__raw = "function() require'harpoon':list():select(1) end"; }
      { mode = "n"; key = "<M-j>"; action.__raw = "function() require'harpoon':list():select(2) end"; }
      { mode = "n"; key = "<M-k>"; action.__raw = "function() require'harpoon':list():select(3) end"; }
      { mode = "n"; key = "<M-l>"; action.__raw = "function() require'harpoon':list():select(4) end"; }
    ];
  };
}
