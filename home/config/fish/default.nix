{
  config,
  ...
}:

{
  imports = [
    ./functions

    ./completions.nix
    ./plugins.nix
  ];

  programs.fish = {
    enable = true;

    # fish 4.8.0 (nixpkgs master) removed share/fish/tools/create_manpage_completions.py,
    # which home-manager's man-page completion generator depends on. Disable it to unbreak builds.
    generateCompletions = false;

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
