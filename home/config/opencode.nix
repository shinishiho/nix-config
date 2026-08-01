_:

{
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;
  };

  home.persistence."/persistent".directories = [
    ".local/share/opencode"
  ];
}
