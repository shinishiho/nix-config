{
  config,
  pkgs,
  ...
}:

{
  programs.vscode = {
    enable = true;
    package = pkgs.vscode;
  };

  home.persistence."/persistent".directories = [
    ".config/Code/User"
    ".vscode"
  ];
}
