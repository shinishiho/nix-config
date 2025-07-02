{
  home.persistence = {
    "/persistent/home/w" = {
      directories = [
        "nix-config"
        "W"
        ".gnupg"
        ".ssh"
        ".nixops"
        ".config/fcitx5"
        ".config/goa-1.0"
        ".local/share/direnv"
        ".local/share/keyrings"
        {
          directory = ".local/share/Steam";
          method = "symlink";
        }
        ".local/share/zoxide"
        ".local/share/fish"
        ".miktex"
        ".vim/undodir"
        ".steam"
      ];
      files = [
        # ".zsh_history"
        ".config/hypr/colors.conf"
        ".local/share/nvim/file_frecency.bin"
        ".modal.toml"
      ];
      allowOther = true;
    };
  };
}
