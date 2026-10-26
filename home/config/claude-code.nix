{
  inputs,
  lib,
  pkgs,
  ...
}:

let
  credentialDirectories = [
    "~/.ssh"
    "~/.gnupg"
    "~/.password-store"
    "~/.aws"
  ];
  credentialFiles = [
    "~/.codex/auth.json"
    "~/.claude/.credentials.json"
    "~/.local/share/opencode/auth.json"
  ];
in
{
  programs.claude-code = {
    enable = true;
    package = inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}.claude-code;
    enableMcpIntegration = true;
    mutableSettings = true;
    settings = {
      permissions = {
        defaultMode = "acceptEdits";
        ask = [
          "Bash"
          "Read(**/.env)"
          "Read(**/.env.*)"
        ];
        deny =
          map (path: "Read(${path}/**)") credentialDirectories ++ map (path: "Read(${path})") credentialFiles;
      };
      sandbox = {
        enabled = true;
        failIfUnavailable = true;
        autoAllowBashIfSandboxed = false;
        filesystem.denyRead = credentialDirectories ++ credentialFiles;
      };
    };
  };

  home.packages = lib.optionals pkgs.stdenv.hostPlatform.isLinux [
    pkgs.bubblewrap
    pkgs.socat
  ];

  home.persistence."/persistent".directories = [
    ".claude"
  ];
}
