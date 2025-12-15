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

  home.persistence."/persistent/home/${config.home.username}".directories = [
    ".config/Code/User"
    ".vscode"
  ];
}
