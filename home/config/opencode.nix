_:

{
  programs.opencode = {
    enable = true;
    enableMcpIntegration = true;

    skills = ./skills;
    context = ''
When you need to search docs, use `context7` tools.
    '';

    settings = {
      agent = {
        title = {
          model = "Qwen/Qwen3.6-35B-A3B";
        };
      };
    };
  };

  home.persistence."/persistent".directories = [
    ".local/share/opencode"
  ];
}
