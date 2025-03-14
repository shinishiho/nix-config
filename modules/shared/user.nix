{
  inputs,
  outputs,
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
      shell = pkgs.zsh;
    };
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "w";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;
}
