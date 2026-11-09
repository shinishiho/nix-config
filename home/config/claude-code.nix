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
        defaultMode = "auto";
        ask = [
          "Read(**/.env)"
          "Read(**/.env.*)"
        ];
        deny =
          map (path: "Read(${path}/**)") credentialDirectories ++ map (path: "Read(${path})") credentialFiles;
      };
      sandbox = {
        enabled = true;
        failIfUnavailable = true;
        autoAllowBashIfSandboxed = true;
        network.allowLocalBinding = true;
        excludedCommands = [ "nix *" ];
        filesystem.denyRead = credentialDirectories ++ credentialFiles;
      };
      autoMode = {
        environment = [
          "$defaults"
          "**Host**: one of the user's personal single-user machines, all managed by their Nix flake at ~/nix-config (nix-darwin or NixOS, plus home-manager). No production systems, shared clusters, or other users' workloads run on them."
          "**Host containment** (supersedes the default \"None configured\" entry): Bash runs in the Claude Code OS sandbox: writes confined to the working directory and temp dirs, credential paths unreadable, no network egress unless a command's allowed_domains list is approved. `nix` commands are excluded from the sandbox, so judge them as running on the bare host: running flakes or packages from anywhere other than nixpkgs or ~/nix-config's own inputs is Code from External. Applying system config (`darwin-rebuild`, `nixos-rebuild`, `home-manager switch`) only when the user asks for it."
          "**Local projects**: git repositories directly in ~ (e.g. ~/nix-config) or under ~/W/ are the user's own projects; ~ itself, ~/Library, ~/.config and other dotfiles are not. Processes those repos run (dev servers, bots, watchers) are local development, not production. Their local data (sqlite databases, logs) may hold other people's messages: reading it into the session for the task is fine; copying it into commits, test fixtures, files outside the repo, or any network destination is not."
        ];
        allow = [
          "$defaults"
          "Local Dev Process Control: Stopping, restarting, or signalling a process that one of the user's own repos (see Local projects) runs on this machine is routine local development, not Interfere With Workloads, when the process is identified by the repo's pid file or by `pgrep -f`/`pkill -f` matching the repo's absolute path or a binary inside it. Name-only matches (`pkill node`, `killall python`), service managers (`launchctl`, `systemctl`), other users' processes, and remote hosts are not covered. An explicit user instruction to leave a process running still wins."
        ];
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
