{
  config,
  ...
}:

{
  imports = [
    ./plugins.nix
    ./functions/yazi.nix
  ];

  programs.fish = {
    enable = true;

    shellInitLast = ''
      set -g fish_key_bindings fish_vi_key_bindings
    '';

    shellAbbrs = config.home.shellAliases;
  };

  home.shell.enableFishIntegration = true;

  home.persistence."/persistent/home/${config.home.username}".directories = [
    ".local/share/fish"
  ];
}
