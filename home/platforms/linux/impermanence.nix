{
  home.persistence = {
    "/persistent/home/w" = {
      directories = [
        "VGU"
        "nix-config"
        "Misc"
        ".gnupg"
        ".ssh"
        ".nixops"
        ".config/fcitx5"
        ".config/goa-1.0"
        ".config/nekoray"
        ".config/vivaldi"
        ".local/share/direnv"
        ".local/share/keyrings"
        {
          directory = ".local/share/Steam";
          method = "symlink";
        }
        ".local/share/zoxide"
        ".vim/undodir"
        ".parsec"
        ".steam"
      ];
      files = [
        ".zsh_history"
        ".local/share/nvim/file_frecency.bin"
        ".modal.toml"
      ];
      allowOther = true;
    };
  };
}