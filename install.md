# Just run

```nix
nix-shell -p disko
sudo disko --mode disko --flake .#iamw
sudo nixos-install --no-channel-copy --no-root-password --flake .#iamw
```
