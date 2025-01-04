{ pkgs, ... }: {
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;

    initExtra = ''
    setopt correct
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
      sw = "sudo nixos-rebuild switch --flake .#iamw --impure";

      ".." = "cd ..";
      "..." = "cd ../..";
      ".3" = "cd ../../..";
      ".4" = "cd ../../../..";
      ".5" = "cd ../../../../..";

      mkdir = "mkdir -p";
    };
  };
}
