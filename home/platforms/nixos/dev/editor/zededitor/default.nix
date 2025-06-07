{
  imports = [
    ./settings.nix
    ./keymap.nix
  ];

  programs.zed-editor = {
    enable = true;
    extensions = [
      "nix"
      "toml"
      "make"
      "catppuccin"
      "latex"
      "catppuccin-icons"
    ];
  };

  home.persistence."/persistent/home/w" = {
    directories = [
      ".local/share/zed"
    ];
  };
}
