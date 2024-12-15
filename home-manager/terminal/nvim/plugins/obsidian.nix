{
  programs.nixvim.plugins.obsidian = {
    enable = true;

    settings = {
      completion = {
        min_chars = 2;
        nvim_cmp = true;
      };
      new_notes_location = "current_dir";
      workspaces = [
        {
          name = "W";
          path = "~/Downloads/W";
        }
      ];

      daily_notes = {
        folder = "Journals";
        date_format = "%dd-%mm-%YYYY";
        alias_format = "%B %-d; %Y";
      };

      templates = {
        subdir = "Templates";
      };
    };
  };
}
