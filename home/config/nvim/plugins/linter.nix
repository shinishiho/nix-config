{
  pkgs,
  ...
}:

{
  programs.nixvim.plugins.lint = {
    enable = true;
    lintersByFt = {
      markdown = [
        "rumdl"
      ];
      javascript = [
        "eslint_d"
      ];
      javascriptreact = [
        "eslint_d"
      ];
      typescript = [
        "eslint_d"
      ];
      typescriptreact = [
        "eslint_d"
      ];
      nix = [
        "statix"
        "deadnix"
      ];
    };
  };

  programs.nixvim.extraPackages = with pkgs; [
    rumdl
    statix
    deadnix
  ];
}
