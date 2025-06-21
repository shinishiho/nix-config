{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

let
  inherit (lib) mkEnableOption mkIf optionalAttrs;
in
{
  options.vscode = {
    enable = mkEnableOption "VSCode configuration";
  };

  config = mkIf config.vscode.enable ({
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
            james-yu.latex-workshop
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
  } // optionalAttrs (platform == "linux") {
    home.persistence."/persistent/home/w" = {
      directories = [
        ".config/Code/User"
        ".vscode"
      ];
    };
  });
}
