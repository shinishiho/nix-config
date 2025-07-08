{
  inputs,
  ...
}:

{
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ];

  home.persistence = {
    "/persistent/home/w" = {
      directories = [
        "nix-config"
        "W"
        ".gnupg"
        ".ssh"
        ".nixops"
        # ".config/fcitx5"
        ".local/share/direnv"
        ".local/share/keyrings"
        ".local/share/zoxide"
        ".local/share/fish"
        ".gemini"
        ".vim/undodir"
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
