{
  pkgs,
  ...
}:

{
  programs.gemini-cli = {
    enable = true;
  };

  home.persistence."/persistent".directories = [
    ".gemini"
  ];
}
