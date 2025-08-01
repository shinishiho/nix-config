{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.my-apps.editors.nvim;
in
{
  options.my-apps.editors.nvim = {
    enable = mkEnableOption "Neovim";
  };

  imports = [
    ./keymap.nix
    ./opts.nix
    ./plugins.nix
  ];

  config = mkIf cfg.enable {
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
  };
}