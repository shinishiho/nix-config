{ inputs, pkgs, ... }:
{
  imports = [
    ./keymap.nix
    ./opts.nix
    ./plugins.nix
  ];

  programs.nixvim = {
    enable = true;
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
