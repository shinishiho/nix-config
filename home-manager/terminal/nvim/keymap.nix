{
  programs.nixvim = {
    keymaps = [
      {
        mode = "n";
        key = "-";
        action = "<cmd>Oil<CR>";
      }
      {
        mode = "v";
        key = "J";
        action = ":m '>+1<CR>gv=gv";
      }
      {
        mode = "v";
        key = "K";
        action = ":m '<-2<CR>gv=gv";
      }
      {
        mode = "n";
        key = "J";
        action = "mzJz";
      }
      {
        mode = "n";
        key = "<C-d>";
        action = "<C-d>zz";
      }
      {
        mode = "n";
        key = "<C-u>";
        action = "<C-u>zz";
      }
      {
        mode = "n";
        key = "n";
        action = "nzzzv";
      }
      {
        mode = "n";
        key = "N";
        action = "Nzzzv";
      }
      {
        mode = "x";
        key = "<leader>p";
        action = "\"_dP";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>y";
        action = "\"+y";
      }
      {
        mode = "n";
        key = "<leader>Y";
        action = "\"+Y";
      }
      {
        mode = [
          "n"
          "v"
        ];
        key = "<leader>d";
        action = "\"_d";
      }
      {
        mode = "i";
        key = "<C-c>";
        action = "<Esc>";
      }
      {
        mode = "n";
        key = "Q";
        action = "<nop>";
      }
      {
        mode = "n";
        key = "<C-f>";
        action = "<cmd>silent !tmux neww tmux-sessionizer<CR>";
      }
      {
        mode = "n";
        key = "<leader>fo";
        action = "vim.lsp.buf.format";
      }
      {
        mode = "n";
        key = "<C-k>";
        action = "<cmd>cnext<CR>zz";
      }
      {
        mode = "n";
        key = "<C-j>";
        action = "<cmd>cprev<CR>zz";
      }
      {
        mode = "n";
        key = "<leader>k";
        action = "<cmd>lnext<CR>zz";
      }
      {
        mode = "n";
        key = "<leader>j";
        action = "<cmd>lprev<CR>zz";
      }
      {
        mode = "n";
        key = "<leader>r";
        action = ":%s/\\<<C-r><C-w>\\>/<C-r><C-w>/gI<Left><Left><Left>";
      }
      {
        mode = "n";
        key = "<leader>x";
        action = "<cmd>!chmod +x %<CR>";
        options.silent = true;
      }
      {
        mode = "n";
        key = "<leader>run";
        action = "<cmd>RunCode<CR>";
      }
      {
        mode = "n";
        key = "<leader>u";
        action = "<CMD>UndotreeToggle<CR>";
      }
    ];
  };
}
