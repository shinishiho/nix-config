{
  pkgs,
  ...
}:

{
  programs.opencode = {
    enable = true;
  };

  home.persistence."/persistent".directories = [
    ".local/share/opencode"
  ];
}
