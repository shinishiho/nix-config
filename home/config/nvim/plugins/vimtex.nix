{
  pkgs,
  ...
}:

{
  programs.nixvim.plugins.vimtex = {
    enable = true;
    texlivePackage = pkgs.texliveFull;
  };
}
