{
  programs.nixvim = {
    plugins.smart-splits = {
      enable = true;
      settings = {
        at_wrap = "mux";
        zellij_move_focus_or_tab = true;
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<C-h>";
        action.__raw = ''require('smart-splits').move_cursor_left'';
      }
      {
        mode = "n";
        key = "<C-j>";
        action.__raw = ''require('smart-splits').move_cursor_down'';
      }
      {
        mode = "n";
        key = "<C-k>";
        action.__raw = ''require('smart-splits').move_cursor_up'';
      }
      {
        mode = "n";
        key = "<C-l>";
        action.__raw = ''require('smart-splits').move_cursor_right'';
      }
    ];
  };
}
