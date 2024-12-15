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
      extraGroups = [ "networkmanager" "wheel" "video" "davfs2" ];
      shell = pkgs.zsh;
      ignoreShellProgramCheck = true;
    };
  };

  home-manager = {
    backupFileExtension = "backup";
    extraSpecialArgs = { inherit inputs outputs; };
    users = {
      w = import ../home-manager/home.nix;
    };
  };

  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "w";
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

}
