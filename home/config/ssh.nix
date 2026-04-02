{
  pkgs,
  ...
}:

{
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      matchBlocks = {
        "*" = {
          forwardAgent = true;
          serverAliveInterval = 0;
          serverAliveCountMax = 3;
          compression = false;
          addKeysToAgent = "yes";
          # identityFile = [ "~/.ssh/id_ed25519_sk" "~/.ssh/id_ed25519_sk_rk" ];
          hashKnownHosts = false;
          userKnownHostsFile = "~/.ssh/known_hosts";
          controlMaster = "no";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "no";
        };
      };
    };
  };

  # Force use nix binary
  home.packages = [ pkgs.openssh ];
}

