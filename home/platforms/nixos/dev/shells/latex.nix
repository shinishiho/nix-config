{
  pkgs,
  ...
}:
{
  home.packages = [
    (pkgs.mkShell {
      name = "latex-env";
      packages = with pkgs; [
        miktex
        tex-fmt
      ];
    })
  ];
}
