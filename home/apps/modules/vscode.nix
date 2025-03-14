{ config, lib, pkgs, ... }:

let
  inherit (lib) mkEnableOption mkIf;
in
{
  options.vscode = {
    enable = mkEnableOption "VSCode configuration";
  };

  config = mkIf config.vscode.enable {
    programs.vscode = {
      enable = true;
      package = pkgs.vscode;

      profiles = {
        default = {
          extensions = with pkgs.vscode-extensions; [
            bbenoist.nix
            ms-vscode.cpptools-extension-pack
            catppuccin.catppuccin-vsc
            catppuccin.catppuccin-vsc-icons
            github.copilot
            github.copilot-chat
            vscodevim.vim
            saoudrizwan.claude-dev
          ];

          userSettings = {
            "workbench.colorTheme" = "Catppuccin Mocha";
            "workbench.iconTheme" = "catppuccin-mocha";
            "github.copilot.selectedCompletionModel" = "gpt-4o-copilot";
            "github.copilot.nextEditSuggestions.enabled" = true;
          };
        };
      };
    };

    home.persistence."/persistent/home/w" = {
      directories = [
        ".config/Code/User"
        ".vscode"
      ];
    };
  };
} 