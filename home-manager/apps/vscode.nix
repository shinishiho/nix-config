{ pkgs, ... }:
{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;

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
    };
  };
}
