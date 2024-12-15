{pkgs, ...}: {
  programs.vscode = {
    enable = true;
    package = pkgs.vscodium;

    extensions = with pkgs.vscode-extensions; [
      bbenoist.nix
      ms-vscode.cpptools-extension-pack
      catppuccin.catppuccin-vsc
      catppuccin.catppuccin-vsc-icons
      github.copilot
    ];
  };
}
