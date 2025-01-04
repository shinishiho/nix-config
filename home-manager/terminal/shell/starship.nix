{ pkgs, ... }: {
  programs.starship = {
    enable = true;
    settings = (builtins.fromTOML (builtins.readFile ./pure.toml));
  };
}
