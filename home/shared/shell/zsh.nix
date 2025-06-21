{
  programs.zsh = {
    enable = true;

    autocd = true;
    autosuggestion.enable = true;
    enableCompletion = true;
    historySubstringSearch.enable = true;

    initContent = ''
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
      sw = "sudo nixos-rebuild switch --flake ~/nix-config#iamw --impure";
      bye = "gnome-session-quit --logout --no-prompt";
    };
  };
}
