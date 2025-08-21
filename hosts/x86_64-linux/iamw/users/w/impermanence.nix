{
  home.persistence."/persistent/home/w" = {
    directories = [
      "nix-config"
      "W"
      ".nixops"
      ".gemini"
    ];
    files = [
      ".config/hypr/colors.conf"
      ".local/share/nvim/file_frecency.bin"
      ".modal.toml"
    ];
    allowOther = true;
  };
}
