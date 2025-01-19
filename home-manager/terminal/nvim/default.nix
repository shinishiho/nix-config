{ inputs, pkgs, ... } : {
  imports = [
    ./keymap.nix
    ./opts.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
    package = inputs.neovim-nightly-overlay.packages.${pkgs.system}.default;
    defaultEditor = true;
    vimdiffAlias = true;
    viAlias = true;
    vimAlias = true;
    withNodeJs = true;

    globals = {
      mapleader = " ";
      #markdown_folding = 1;
    };
  };
}
