# Shared modules for both NixOS and Darwin
{ ... }: {
  imports = [
    ./timelangloc.nix
    ./user.nix
    # Add other shared modules here
  ];
}
