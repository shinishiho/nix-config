{
  platform ? "linux",
  ...
}:
{
  imports = [
    ./visual
    ./scripts
    ./tools

    ./kitty.nix
    ./tmux.nix
    ./zellij.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}