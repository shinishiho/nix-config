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
