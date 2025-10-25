{
  programs.nixvim.plugins.oil = {
    enable = true;
    settings = {
      columns = [
        "icon"
        "size"
      ];

      watch_for_changes = true;
      skip_confirm_for_simple_edits = true;

      keymaps = {
        "<C-c>" = false;
        "<C-l>" = false;
        "<C-h>" = false;
        "<C-r>" = "actions.refresh";
        "y." = "actions.copy_entry_path";
      };

      float.preview_split = "right";
    };
  };
}
