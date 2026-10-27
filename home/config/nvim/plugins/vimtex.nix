{
  pkgs,
  ...
}:

{
  programs.nixvim.plugins.vimtex = {
    enable = true;
    texlivePackage = pkgs.texliveSmall.withPackages (ps: [ ps.latexmk ]);
  };
}
