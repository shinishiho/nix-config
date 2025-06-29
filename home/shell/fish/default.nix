{
  config,
  lib,
  ...
}:

{
  imports = [
    ./aliases.nix
    ./plugins.nix
    ./functions/duf.nix
    ./functions/ffcd.nix
    ./functions/ffe.nix
    ./functions/ffec.nix
    ./functions/fan.nix
  ];

  programs.fish = {
    enable = true;

    shellInitLast = ''
      set -g fish_key_bindings fish_vi_key_bindings
      ${lib.optionalString config.programs.zellij.enable ''
        if set -q ZELLIJ
        else
          zellij
        end
      ''}
    '';
  };
}
