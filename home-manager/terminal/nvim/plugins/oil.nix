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
        "<ESC>" = "actions.close";
        "y." = "actions.copy_entry_path";
        "h" = "actions.parent";
      };

      float.preview_split = "right";
    };
	};
}
