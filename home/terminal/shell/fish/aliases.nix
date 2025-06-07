{
  programs.fish = {
    shellAliases = {
      l = "eza -lh";
      ls = "eza -1";
      ll = "eza -lha --sort=name --group-directories-first";
      ld = "eza -lhD";
      lt = "eza --tree";

      clr = "clear";

      ff = "fastfetch";
      v = "nvim";

      gc = "sudo nix-collect-garbage && sudo nix-collect-garbage -d";
      sw = "sudo nixos-rebuild switch --flake ~/nix-config#iamw --impure";
      bye = "gnome-session-quit --logout --no-prompt";

      protonsync = "rclone sync ~/W proton: --progress --verbose";
    };

    shellAbbrs = {
      ".." = "cd ..";
      "..." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";

      mkdir = "mkdir -p";
    };
  };
}
