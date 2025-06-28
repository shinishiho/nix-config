{
  programs.fish = {
    shellAliases = {
      sw = "sudo nixos-rebuild switch --flake ~/nix-config#iamw --impure";
      bye = "gnome-session-quit --logout --no-prompt";
      protonsync = "rclone sync ~/W proton: --progress --verbose";
    };
  };
}
