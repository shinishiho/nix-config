{
  edit_predictions = {
    provider = "copilot";
  };
  icon_theme = "Catppuccin Frappé";
  agent_servers = {
    qwen-code = {
      type = "registry";
    };
    github-copilot = {
      type = "registry";
    };
  };
  use_smartcase_search = true;
  diagnostics = {
    inline = {
      enabled = true;
    };
  };
  prettier = {
    allowed = true;
  };
  semantic_tokens = "combined";
  vim = {
    use_smartcase_find = true;
    toggle_relative_line_numbers = true;
  };
  which_key = {
    enabled = true;
  };
  autosave = {
    after_delay = {
      milliseconds = 2000;
    };
  };
  cursor_shape = "bar";
  buffer_font_family = "CaskaydiaCove Nerd Font Mono";
  redact_private_values = true;
  use_system_prompts = false;
  use_system_path_prompts = false;
  session = {
    trust_all_worktrees = true;
  };
  vim_mode = true;
  ui_font_size = 16;
  buffer_font_size = 15;
  theme = "Matugen Dark";
  load_direnv = "shell_hook";
}
