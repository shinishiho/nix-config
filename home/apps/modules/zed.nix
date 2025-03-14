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
      ];
      extraPackages = with pkgs; [
        nixd
        nil
      ];

      userSettings = {
        features = {
          edit_prediction_provider = "zed";
        };

        assistant = {
          enabled = true;
          version = "2";
          default_open_ai_model = null;
          default_model = {
            provider = "zed.dev";
            model = "claude-3-5-sonnet-latest";
          };

          inline_alternatives = [
            {
              provider = "zed.dev";
              model = "claude-3-5-sonnet-latest";
            }
          ];
        };

        node = {
          path = lib.getExe pkgs.nodejs;
          npm_path = lib.getExe' pkgs.nodejs "npm";
        };

        hour_format = "hour24";
        auto_update = false;
        terminal = {
          alternate_scroll = "off";
          blinking = "off";
          copy_on_select = false;
          dock = "bottom";
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
          env = {
            TERM = "kitty";
          };
          font_family = "CaskaydiaCove Nerd Font";
          font_features = null;
          font_size = 15;
          line_height = "comfortable";
          option_as_meta = false;
          button = false;
          shell = "system";
          program = "zsh";
          toolbar = {
            title = true;
          };
          working_directory = "current_project_directory";
        };

        lsp = {
          rust-analyzer = {
            binary = {
              path_lookup = true;
            };
          };
          nix = {
            binary = {
              path_lookup = true;
            };
          };
        };

        vim_mode = true;
        load_direnv = "shell_hook";
        base_keymap = "VSCode";
        theme = {
          mode = "system";
          light = "Catppuccin Latte";
          dark = "Catppuccin Mocha";
        };
        show_whitespaces = "selection";
        ui_font_size = 16;
        buffer_font_size = 16;
      };
    };

    home.persistence."/persistent/home/w" = {
      directories = [
        ".local/share/zed"
      ];
    };
  };
} 