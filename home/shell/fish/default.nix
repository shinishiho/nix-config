{
  imports = [
    ./plugins.nix
    ./functions/ffcd.nix
    ./functions/ffe.nix
    ./functions/ffec.nix
    ./functions/yazi.nix
  ];

  programs.fish = {
    enable = true;

    shellInitLast = ''
      set -g fish_key_bindings fish_vi_key_bindings
    '';
  };
}
