{
  inputs,
  pkgs,
  ...
}:

{
  programs.claude-code = {
    enable = true;
    package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.claude-code;
    enableMcpIntegration = true;

    skills = ./skills;
  };

  home.persistence."/persistent".directories = [
    ".claude"
  ];
}
