{
  config,
  ...
}:

{
  imports = [
    ./completions.nix
    ./plugins.nix
  ];

  programs.fish = {
    enable = true;

    shellInitLast = ''
      set -g fish_key_bindings fish_vi_key_bindings
    '';

    shellAbbrs = config.home.shellAliases;
  };

  home.shell.enableFishIntegration = true;

  home.persistence."/persistent".directories = [
    ".local/share/fish"
  ];
}
