{
  pkgs,
  ...
}:
{
  users.mutableUsers = false;
  users.users = {
    w = {
      initialPassword = "iamw";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [
        "adbusers"
        "docker"
        "networkmanager"
        "video"
        "wheel"
      ];
      shell = pkgs.fish;
    };
  };

  programs.fish.enable = true;

  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
