{
  config,
  ...
}:

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

  home.persistence."/persistent/home/${config.home.username}".directories = [
    ".vim/undodir"
  ];
}
