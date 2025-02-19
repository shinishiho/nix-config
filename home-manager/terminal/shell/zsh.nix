{ pkgs, ... }:
{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;

    initExtra = ''
      setopt correct

      if [[ "$(tty)" = /dev/tty2 && $SHLVL -eq 1 ]]; then
        labwc
        exit
      fi
    '';

    completionInit = ''
      zstyle ':completion:*' matcher-list ''' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'
      autoload -Uz compinit && compinit
    '';

    shellAliases = {
      ls = "eza -1";
      l = "eza -lh";
      ll = "eza -lha --sort=name --group-directories-first";
      ld = "eza -lhD";

      clr = "clear";
      fk = "fuck";

      f = "fastfetch";
      v = "nvim";

      gc = "sudo nix-collect-garbage && sudo nix-collect-garbage -d";
      sw = "sudo nixos-rebuild switch --flake ~/nix-config#iamw --impure";
      bye = "gnome-session-quit --logout --no-prompt";

      ".." = "cd ..";
      "..." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";

      mkdir = "mkdir -p";
    };
  };
}
