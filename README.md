# I use Nix BTW

Welcome to my NixOS configuration!

## Features

- Multi-platform (NixOS + nix-darwin)
- Modular structure

## What I use

| Category    | App                  | Category   | App       |
| ----------- | -------------------- | ---------- | --------- |
| WM          | Hyprland             | Launcher   | rofi      |
| Browser     | Firefox, Zen Browser | Terminal   | kitty     |
| Editor      | neovim, code         | Shell      | fish      |
| Mail        | thunderbird          | Media      | mpv       |
| Chat        | signal-desktop       | Screenshot | Flameshot |
| File Mgr    | yazi                 | PDF        | zathura   |
| WM (darwin) | Aerospace            | Nix helper | nh        |

## Structure

```
.
├── flake.nix
├── flake.lock
├── hosts/
│   ├── aarch64-darwin/
│   │   └── iamw-m1/
│   └── x86_64-linux/
│       └── iamw/
├── home/
│   ├── common/
│   └── platform/
│       ├── aarch64-darwin/
│       └── x86_64-linux/
├── modules/
│   ├── common/         # Will be apply to all platforms
│   ├── nix-darwin/
│   └── nixos/
└── pkgs/
```

## Usage Guide

### Modifying hosts

1. Create a new directory under `hosts/<platform>/<hostname>` with your system configuration
2. Add your system to the `nixosConfigurations` or `darwinConfiguration` in `flake.nix`:

```nix
nixosConfigurations = { # or darwinConfiguration = {
  your_host = lib.mkNixosConfig {
    system = "x86_64-linux"; # or "aarch64-linux" for nixOS, "aarch64-darwin" or "x86_64-darwin" for nix-darwin
    hostname = "your_host";
    username = "your_username";
  };
};
```

## Applying configuration

### NixOS

```bash
nh os switch -a . -H hostname
```

### Darwin (macOS)

```bash
nh darwin switch -a . -H hostname
```

## License

See the [LICENSE](LICENSE) file for details.
