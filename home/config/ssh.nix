{
  pkgs,
  ...
}:

{
  programs = {
    ssh = {
      enable = true;
      enableDefaultConfig = false;
      settings."*" = {
        ForwardAgent = true;
        ServerAliveInterval = 0;
        ServerAliveCountMax = 3;
        Compression = false;
        AddKeysToAgent = "yes";
        # identityFile = [ "~/.ssh/id_ed25519_sk" "~/.ssh/id_ed25519_sk_rk" ];
        HashKnownHosts = false;
        UserKnownHostsFile = "~/.ssh/known_hosts";
        ControlMaster = "no";
        ControlPath = "~/.ssh/master-%r@%n:%p";
        ControlPersist = "no";
      };
    };
  };

  # Force use nix binary
  home.packages = [ pkgs.openssh ];
}
