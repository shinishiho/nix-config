{
  programs = {
    ssh = {
      matchBlocks = {
        "nakxkri.cuscus-typhon.ts.net" = {
          user = "w";
          forwardAgent = true;
        };

        "*" = {
          forwardAgent = false;
          serverAliveInterval = 0;
          serverAliveCountMax = 3;
          compression = false;
          addKeysToAgent = "yes";
          identityFile = [ "~/.ssh/id_ed25519_sk" ];
          hashKnownHosts = false;
          userKnownHostsFile = "~/.ssh/known_hosts";
          controlMaster = "no";
          controlPath = "~/.ssh/master-%r@%n:%p";
          controlPersist = "no";
        };
      };
    };
  };
}

