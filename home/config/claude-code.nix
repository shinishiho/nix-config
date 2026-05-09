_:

{
  programs.claude-code = {
    enable = true;
    enableMcpIntegration = true;

    skills = ./skills;

    settings = {
      env = {
        ANTHROPIC_BASE_URL = "https://nano-gpt.com/api/v1";
        ANTHROPIC_DEFAULT_SONNET_MODEL = "moonshotai/kimi-k2.6:thinking";
        ANTHROPIC_DEFAULT_OPUS_MODEL = "moonshotai/kimi-k2.6:thinking";
        ANTHROPIC_DEFAULT_HAIKU_MODEL = "moonshotai/kimi-k2.6:thinking";
        API_TIMEOUT_MS = "600000";
      };
    };
  };
  
  home.persistence."/persistent".directories = [
    ".claude"
  ];
}
