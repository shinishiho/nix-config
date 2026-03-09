{
  pkgs,
  ...
}:
{
  imports = [
    ./plugins/cloak.nix
    ./plugins/colorscheme.nix
    ./plugins/column.nix
    # ./plugins/coderunner.nix
    ./plugins/harpoon.nix
    #./plugins/linter.nix
    ./plugins/leap.nix
    ./plugins/lsp.nix
    # ./plugins/obsidian.nix
    ./plugins/mpv.nix
    ./plugins/noice.nix
    ./plugins/oil.nix
    ./plugins/smart-splits.nix
    ./plugins/snippets.nix
    ./plugins/sniprun.nix
    ./plugins/telescope.nix
    ./plugins/treesitter.nix
    ./plugins/trouble.nix
  ];

  home.packages = with pkgs; [
    luajitPackages.magick
  ];

  programs.nixvim.plugins = {
    barbecue.enable = true;
    fugitive.enable = true;
    image.enable = true;
    indent-blankline.enable = true;
    markdown-preview.enable = true;
    nvim-autopairs.enable = true;
    rainbow-delimiters.enable = true;
    tmux-navigator.enable = false;
    twilight.enable = true;
    undotree.enable = true;
    web-devicons.enable = true;
  };
}
