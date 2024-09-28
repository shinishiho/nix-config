{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}:

let
  tuigreet = "${pkgs.greetd.tuigreet}/bin/tuigreet";
  session = "${pkgs.hyprland}/bin/Hyprland";
  username = "w";
in

{
  users.mutableUsers = false;
  
  users.users = {
    w = {
      initialPassword = "iamw";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      # TODO: Be sure to add any other groups you need (such as networkmanager, audio, docker, etc)
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

  services.greetd = {
    enable = true;
    settings = {
      initial_session = {
        command = "${session}";
        user = "${username}";
      };
      default_session = {
        command = "${tuigreet} --greeting 'Welcome to NixOS!' --asterisks --remember --remember-user-session --time -cmd ${session}";
        user = "greeter";
      };
    };
  };
}
