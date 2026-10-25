_:

{
  programs.antigravity-cli = {
    enable = true;
  };

  home.persistence."/persistent".directories = [
    ".gemini"
  ];
}
