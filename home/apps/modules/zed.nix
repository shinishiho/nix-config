{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.zed = {
    enable = mkEnableOption "Zed editor configuration";
  };

  config = mkIf config.zed.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "toml"
        "make"
        "catppuccin"
        "latex"
        "catppuccin-icons"
      ];
      extraPackages = with pkgs; [
        nixd
      ];

      userSettings = {
        theme = {
          mode = "system";
          light = "Catppuccin Latte";
          dark = "Catppuccin Mocha";
        };
        icon_theme = "Catppuccin Mocha";
        base_keymap = "VSCode";
        features = {
          edit_prediction_provider = "zed";
        };
        buffer_font_family = "CaskaydiaCove Nerd Font Mono";
        buffer_font_fallbacks = [
          "Zed Plex Mono"
        ];
        buffer_font_features = {
        };
        buffer_font_size = 22;
        buffer_font_weight = 400;
        buffer_line_height = "comfortable";
        ui_font_family = "CaskaydiaCove Nerd Font";
        ui_font_fallbacks = [
          "Zed Plex Sans"
        ];
        ui_font_features = {
          calt = false;
        };
        ui_font_weight = 400;
        ui_font_size = 20;
        agent_font_size = 18;
        unnecessary_code_fade = 0.3;
        active_pane_modifiers = {
          magnification = 1.4;
          border_size = 0;
          inactive_opacity = 0.8;
        };
        bottom_dock_layout = "contained";
        pane_split_direction_horizontal = "down";
        pane_split_direction_vertical = "right";
        centered_layout = {
          left_padding = 0.2;
          right_padding = 0.2;
        };
        image_viewer = {
          unit = "binary";
        };
        multi_cursor_modifier = "alt";
        vim_mode = true;
        hover_popover_enabled = true;
        hover_popover_delay = 300;
        confirm_quit = false;
        restore_on_startup = "last_session";
        restore_on_file_reopen = true;
        drop_target_size = 0.2;
        when_closing_with_no_tabs = "platform_default";
        on_last_window_closed = "platform_default";
        use_system_path_prompts = false;
        use_system_prompts = false;
        cursor_blink = true;
        cursor_shape = "block";
        hide_mouse = "on_typing_and_movement";
        snippet_sort_order = "inline";
        current_line_highlight = "all";
        selection_highlight = true;
        lsp_highlight_debounce = 75;
        show_completions_on_input = true;
        show_completion_documentation = true;
        auto_signature_help = true;
        show_signature_help_after_edits = true;
        inline_code_actions = true;
        go_to_definition_fallback = "find_all_references";
        diagnostics_max_severity = null;
        show_wrap_guides = true;
        wrap_guides = [
          80
          100
        ];
        redact_private_values = true;
        expand_excerpt_lines = 5;
        private_files = [
          "**/.env*"
          "**/*.pem"
          "**/*.key"
          "**/*.cert"
          "**/*.crt"
          "**/secrets.yml"
        ];
        use_on_type_format = true;
        use_autoclose = true;
        use_auto_surround = true;
        auto_indent_on_paste = true;
        always_treat_brackets_as_autoclosed = true;
        allow_rewrap = "in_comments";
        show_edit_predictions = true;
        edit_predictions_disabled_in = [

        ];
        show_whitespaces = "boundary";
        calls = {
          mute_on_join = true;
          share_on_join = false;
        };
        toolbar = {
          breadcrumbs = true;
          quick_actions = true;
          selections_menu = true;
          agent_review = true;
          code_actions = false;
        };
        title_bar = {
          show_branch_icon = true;
          show_branch_name = true;
          show_project_items = true;
          show_onboarding_banner = true;
          show_user_picture = true;
          show_sign_in = true;
        };
        scrollbar = {
          show = "auto";
          cursors = true;
          git_diff = true;
          search_results = true;
          selected_text = true;
          selected_symbol = true;
          diagnostics = "all";
          axes = {
            horizontal = true;
            vertical = true;
          };
        };
        minimap = {
          show = "never";
          thumb = "always";
          thumb_border = "left_open";
          current_line_highlight = null;
        };
        middle_click_paste = true;
        double_click_in_multibuffer = "select";
        gutter = {
          line_numbers = true;
          runnables = true;
          breakpoints = true;
          folds = true;
        };
        indent_guides = {
          enabled = true;
          line_width = 1;
          active_line_width = 1;
          coloring = "indent_aware";
          background_coloring = "disabled";
        };
        scroll_beyond_last_line = "one_page";
        vertical_scroll_margin = 3;
        autoscroll_on_clicks = false;
        horizontal_scroll_margin = 5;
        scroll_sensitivity = 1;
        relative_line_numbers = true;
        search_wrap = true;
        search = {
          button = true;
          whole_word = false;
          case_sensitive = false;
          include_ignored = false;
          regex = false;
        };
        seed_search_query_from_cursor = "selection";
        use_smartcase_search = true;
        inlay_hints = {
          enabled = true;
          show_type_hints = true;
          show_parameter_hints = true;
          show_other_hints = true;
          show_background = false;
          edit_debounce_ms = 700;
          scroll_debounce_ms = 50;
          toggle_on_modifiers_press = {
            control = false;
            shift = false;
            alt = false;
            platform = false;
            function = false;
          };
        };
        project_panel = {
          button = true;
          hide_gitignore = false;
          default_width = 240;
          dock = "left";
          entry_spacing = "comfortable";
          file_icons = true;
          folder_icons = true;
          git_status = true;
          indent_size = 20;
          auto_reveal_entries = true;
          auto_fold_dirs = true;
          scrollbar = {
            show = null;
          };
          show_diagnostics = "all";
          indent_guides = {
            show = "always";
          };
        };
        outline_panel = {
          button = true;
          default_width = 300;
          dock = "left";
          file_icons = true;
          folder_icons = true;
          git_status = true;
          indent_size = 20;
          auto_reveal_entries = true;
          auto_fold_dirs = true;
          indent_guides = {
            show = "always";
          };
          scrollbar = {
            show = null;
          };
        };
        collaboration_panel = {
          button = true;
          dock = "left";
          default_width = 240;
        };
        chat_panel = {
          button = "when_in_call";
          dock = "right";
          default_width = 240;
        };
        git_panel = {
          button = true;
          dock = "left";
          default_width = 360;
          status_style = "icon";
          fallback_branch_name = "main";
          sort_by_path = false;
          scrollbar = {
            show = null;
          };
        };
        message_editor = {
          auto_replace_emoji_shortcode = true;
        };
        notification_panel = {
          button = true;
          dock = "right";
          default_width = 380;
        };
        agent = {
          version = "2";
          enabled = true;
          preferred_completion_mode = "normal";
          button = true;
          dock = "right";
          default_width = 640;
          default_height = 320;
          default_model = {
            provider = "zed.dev";
            model = "claude-sonnet-4-latest";
          };
          editor_model = {
            provider = "zed.dev";
            model = "claude-3-7-sonnet-latest";
          };
          model_parameters = [

          ];
          always_allow_tool_actions = false;
          stream_edits = true;
          single_file_review = true;
          enable_feedback = true;
          default_profile = "write";
          profiles = {
            write = {
              name = "Write";
              enable_all_context_servers = true;
              tools = {
                copy_path = true;
                create_directory = true;
                create_file = true;
                delete_path = true;
                diagnostics = true;
                edit_file = true;
                fetch = true;
                list_directory = true;
                move_path = true;
                now = true;
                find_path = true;
                read_file = true;
                grep = true;
                terminal = true;
                thinking = true;
                web_search = true;
              };
            };
            ask = {
              name = "Ask";
              tools = {
                contents = true;
                diagnostics = true;
                fetch = true;
                list_directory = true;
                now = true;
                find_path = true;
                read_file = true;
                open = true;
                grep = true;
                thinking = true;
                web_search = true;
              };
            };
            minimal = {
              name = "Minimal";
              enable_all_context_servers = false;
              tools = {
              };
            };
          };
          notify_when_agent_waiting = "primary_screen";
        };
        slash_commands = {
          docs = {
            enabled = false;
          };
          project = {
            enabled = false;
          };
        };
        show_call_status_icon = true;
        enable_language_server = true;
        linked_edits = true;
        language_servers = [
          "..."
        ];
        autosave = "off";
        max_tabs = 5;
        tab_bar = {
          show = true;
          show_nav_history_buttons = true;
          show_tab_bar_buttons = true;
        };
        tabs = {
          git_status = true;
          close_position = "right";
          file_icons = true;
          show_close_button = "hidden";
          activate_on_close = "history";
          show_diagnostics = "all";
        };
        preview_tabs = {
          enabled = true;
          enable_preview_from_file_finder = false;
          enable_preview_from_code_navigation = false;
        };
        file_finder = {
          file_icons = true;
          modal_max_width = "small";
          skip_focus_for_active_in_search = true;
        };
        remove_trailing_whitespace_on_save = true;
        extend_comment_on_newline = true;
        ensure_final_newline_on_save = true;
        format_on_save = "on";
        formatter = "auto";
        soft_wrap = "bounded";
        preferred_line_length = 100;
        hard_tabs = false;
        tab_size = 4;
        debuggers = [

        ];
        telemetry = {
          diagnostics = false;
          metrics = false;
        };
        auto_update = true;
        diagnostics = {
          button = true;
          include_warnings = true;
          inline = {
            enabled = true;
            update_debounce_ms = 150;
            padding = 4;
            min_column = 0;
            max_severity = null;
          };
          cargo = {
            fetch_cargo_diagnostics = false;
          };
        };
        file_scan_exclusions = [
          "**/.git"
          "**/.svn"
          "**/.hg"
          "**/.jj"
          "**/CVS"
          "**/.DS_Store"
          "**/Thumbs.db"
          "**/.classpath"
          "**/.settings"
        ];
        file_scan_inclusions = [
          ".env*"
        ];
        git = {
          git_gutter = "tracked_files";
          inline_blame = {
            enabled = true;
            show_commit_summary = true;
          };
          hunk_style = "staged_hollow";
        };
        git_hosting_providers = [

        ];
        load_direnv = "direct";
        edit_predictions = {
          disabled_globs = [
            "**/.env*"
            "**/*.pem"
            "**/*.key"
            "**/*.cert"
            "**/*.crt"
            "**/.dev.vars"
            "**/secrets.yml"
          ];
          mode = "eager";
          enabled_in_text_threads = true;
        };
        journal = {
          path = "~";
          hour_format = "hour12";
        };
        terminal = {
          shell = "system";
          dock = "bottom";
          default_width = 640;
          default_height = 320;
          working_directory = "current_project_directory";
          blinking = "terminal_controlled";
          cursor_shape = null;
          alternate_scroll = "on";
          option_as_meta = false;
          copy_on_select = false;
          button = true;
          env = {
          };
          line_height = "comfortable";
          detect_venv = {
            on = {
              directories = [
                ".env"
                "env"
                ".venv"
                "venv"
              ];
              activate_script = "default";
            };
          };
          toolbar = {
            breadcrumbs = true;
          };
          scrollbar = {
            show = null;
          };
        };
        code_actions_on_format = {
        };
        tasks = {
          variables = {
          };
          enabled = true;
        };
        file_types = {
          JSONC = [
            "**/.zed/**/*.json"
            "**/zed/**/*.json"
            "**/Zed/**/*.json"
            "**/.vscode/**/*.json"
          ];
          "Shell Script" = [
            ".env.*"
          ];
        };
        node = {
          ignore_system_version = false;
          path = null;
          npm_path = null;
        };
        completions = {
          words = "enabled";
          lsp = true;
          lsp_fetch_timeout_ms = 0;
          lsp_insert_mode = "replace_suffix";
        };
        languages = {
          Astro = {
            language_servers = [
              "astro-language-server"
              "..."
            ];
            prettier = {
              allowed = true;
              plugins = [
                "prettier-plugin-astro"
              ];
            };
          };
          Blade = {
            prettier = {
              allowed = true;
            };
          };
          C = {
            format_on_save = "off";
            use_on_type_format = false;
            prettier = {
              allowed = false;
            };
          };
          "C++" = {
            format_on_save = "off";
            use_on_type_format = false;
            prettier = {
              allowed = false;
            };
          };
          CSS = {
            prettier = {
              allowed = true;
            };
          };
          Dart = {
            tab_size = 2;
          };
          Diff = {
            show_edit_predictions = false;
            remove_trailing_whitespace_on_save = false;
            ensure_final_newline_on_save = false;
          };
          Elixir = {
            language_servers = [
              "elixir-ls"
              "!next-ls"
              "!lexical"
              "..."
            ];
          };
          Elm = {
            tab_size = 4;
          };
          Erlang = {
            language_servers = [
              "erlang-ls"
              "!elp"
              "..."
            ];
          };
          "Git Commit" = {
            allow_rewrap = "anywhere";
          };
          Go = {
            code_actions_on_format = {
              "source.organizeImports" = true;
            };
          };
          GraphQL = {
            prettier = {
              allowed = true;
            };
          };
          HEEX = {
            language_servers = [
              "elixir-ls"
              "!next-ls"
              "!lexical"
              "..."
            ];
          };
          HTML = {
            prettier = {
              allowed = true;
            };
          };
          Java = {
            prettier = {
              allowed = true;
              plugins = [
                "prettier-plugin-java"
              ];
            };
          };
          JavaScript = {
            language_servers = [
              "!typescript-language-server"
              "vtsls"
              "..."
            ];
            prettier = {
              allowed = true;
            };
          };
          JSON = {
            prettier = {
              allowed = true;
            };
            tab_size = 2;
          };
          JSONC = {
            prettier = {
              allowed = true;
            };
            tab_size = 2;
          };
          LaTeX = {
            format_on_save = "on";
            formatter = "language_server";
            language_servers = [
              "texlab"
              "..."
            ];
            prettier = {
              allowed = false;
            };
          };
          Markdown = {
            format_on_save = "off";
            use_on_type_format = false;
            allow_rewrap = "anywhere";
            soft_wrap = "editor_width";
            prettier = {
              allowed = true;
            };
          };
          Nix = {
            format_on_save = "on";
            formatter = "language_server";
            language_servers = [
              "nixd"
              "..."
            ];
            tab_size = 2;
          };
          PHP = {
            language_servers = [
              "phpactor"
              "!intelephense"
              "..."
            ];
            prettier = {
              allowed = true;
              plugins = [
                "@prettier/plugin-php"
              ];
              parser = "php";
            };
          };
          "Plain Text" = {
            allow_rewrap = "anywhere";
          };
          Ruby = {
            language_servers = [
              "solargraph"
              "!ruby-lsp"
              "!rubocop"
              "..."
            ];
          };
          SCSS = {
            prettier = {
              allowed = true;
            };
          };
          SQL = {
            prettier = {
              allowed = true;
              plugins = [
                "prettier-plugin-sql"
              ];
            };
          };
          Starlark = {
            language_servers = [
              "starpls"
              "!buck2-lsp"
              "..."
            ];
          };
          Svelte = {
            language_servers = [
              "svelte-language-server"
              "..."
            ];
            prettier = {
              allowed = true;
              plugins = [
                "prettier-plugin-svelte"
              ];
            };
          };
          TSX = {
            language_servers = [
              "!typescript-language-server"
              "vtsls"
              "..."
            ];
            prettier = {
              allowed = true;
            };
          };
          Twig = {
            prettier = {
              allowed = true;
            };
          };
          TypeScript = {
            language_servers = [
              "!typescript-language-server"
              "vtsls"
              "..."
            ];
            prettier = {
              allowed = true;
            };
          };
          "Vue.js" = {
            language_servers = [
              "vue-language-server"
              "..."
            ];
            prettier = {
              allowed = true;
            };
          };
          XML = {
            prettier = {
              allowed = true;
              plugins = [
                "@prettier/plugin-xml"
              ];
            };
          };
          YAML = {
            prettier = {
              allowed = true;
            };
          };
          Zig = {
            language_servers = [
              "zls"
              "..."
            ];
          };
        };
        language_models = {
          anthropic = {
            version = "1";
            api_url = "https://api.anthropic.com";
          };
          google = {
            api_url = "https://generativelanguage.googleapis.com";
          };
          ollama = {
            api_url = "http://localhost:11434";
          };
          openai = {
            version = "1";
            api_url = "https://api.openai.com/v1";
          };
          lmstudio = {
            api_url = "http://localhost:1234/api/v0";
          };
          deepseek = {
            api_url = "https://api.deepseek.com";
          };
          mistral = {
            api_url = "https://api.mistral.ai/v1";
          };
        };
        prettier = {
        };
        jsx_tag_auto_close = {
          enabled = true;
        };
        lsp = {
        };
        jupyter = {
          enabled = true;
        };
        vim = {
          default_mode = "normal";
          toggle_relative_line_numbers = false;
          use_system_clipboard = "always";
          use_multiline_find = false;
          use_smartcase_find = true;
          highlight_on_yank_duration = 200;
          custom_digraphs = {
          };
          cursor_shape = {
          };
        };
        server_url = "https://zed.dev";
        preview = {
        };
        nightly = {
        };
        stable = {
        };
        dev = {
        };
        line_indicator_format = "short";
        proxy = null;
        command_aliases = {
        };
        ssh_connections = [

        ];
        read_ssh_config = true;
        context_servers = {
        };
        debugger = {
          stepping_granularity = "line";
          save_breakpoints = true;
          button = true;
        };
      };
    };

    home.persistence."/persistent/home/w" = {
      directories = [
        ".local/share/zed"
      ];
    };
  };
}
