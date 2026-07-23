# I use Nix BTW

Welcome to my Nix configuration!

## What I use

### OS

- CachyOS + Home-manager (historical)
- NixOS (it's a thing of the past)
- nix-darwin (I'm stuck in the Apple ecosystem)

### Environment & tools

#### Common

- kitty
- fish
- zellij
- neovim
- zen-browser
- yazi

#### Linux

- Niri
- DankMaterialShell

#### MacOS

- paneru

And more. Config is XDG-compliant under `home/config/`

Lilith wallpapers included. (The NOexistenceN of you AND me)

## Installing from NixOS ISO

```nix
nix-shell -p disko
sudo disko --mode disko --flake .#iamw-<hostname>
sudo nixos-install --no-channel-copy --no-root-password --flake .#iamw-<hostname>
```
