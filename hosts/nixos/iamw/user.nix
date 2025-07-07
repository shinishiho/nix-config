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
        "input"
        "networkmanager"
        "video"
        "wheel"
      ];
      shell = pkgs.fish;
    };
  };

  programs.fish.enable = true;
}
