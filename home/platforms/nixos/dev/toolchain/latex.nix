{
  pkgs,
  ...
}:
{
  programs.texlive = {
    enable = true;
    # packageSet = (
    #   pkgs.texlive.combine {
    #     inherit (pkgs.texlive)
    #       scheme-medium
    #       xifthen
    #       ifmtarg
    #       framed
    #       paralist
    #       titlesec
    #       ;
    #   }
    # );
    extraPackages = tpkgs: {
      inherit (tpkgs)
        scheme-full
        ;
    };
  };

  programs.tex-fmt = {
    enable = true;
  };
}
