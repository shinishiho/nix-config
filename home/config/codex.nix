{
  inputs,
  pkgs,
  ...
}:

{
  programs.codex = {
    enable = true;
    package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.codex;
    enableMcpIntegration = true;
    settings = {
      approval_policy = "on-request";
      sandbox_mode = "workspace-write";
      sandbox_workspace_write.network_access = false;
      shell_environment_policy.ignore_default_excludes = false;
    };
  };

  home.persistence."/persistent".directories = [
    ".codex"
  ];
}
