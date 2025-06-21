# Multi-Platform Nix Configuration

This repository contains my personal Nix configuration, designed to work across multiple platforms including NixOS (Linux) and nix-darwin (macOS).

## Structure

The configuration is organized as follows:

```
.
├── flake.nix           # Main flake configuration
├── flake.lock          # Locked dependencies
├── hosts/              # Host-specific configurations
│   ├── nixos/          # NixOS host configurations
│   │   └── iamw/       # Configuration for 'iamw' NixOS host
│   └── darwin/         # Darwin (macOS) host configurations
│       └── template/   # Template for Darwin hosts
├── home/               # Home-manager configurations
│   ├── apps/           # Application configurations
│   ├── terminal/       # Terminal configurations (shell, tools, misc, scripts)
│   └── platforms/      # Platform-specific configurations
│       ├── nixos/      # NixOS-specific home configurations
│       │   ├── desktop/    # Desktop environments (gnome, hyprland, etc.)
│       │   ├── dev/        # Development tools and environments
│       │   ├── productivity/ # Productivity tools
│       │   └── users/      # User-specific configurations
│       └── darwin/     # Darwin-specific home configurations
│           └── users/      # User-specific configurations
├── modules/            # System-level modules
│   ├── nixos/          # NixOS-specific modules
│   └── darwin/         # Darwin-specific modules
└── pkgs/               # Custom packages
```

## Adding a New System

### Adding a NixOS System

1. Create a new directory under `hosts/nixos/<hostname>` with your system configuration
2. Add your system to the `nixosConfigurations` in `flake.nix`:

```nix
nixosConfigurations = {
  # Existing systems
  iamw = lib.mkNixosConfig {
    system = "x86_64-linux";
    hostname = "iamw";
  };
  
  # Your new system
  new-system = lib.mkNixosConfig {
    system = "x86_64-linux"; # or "aarch64-linux"
    hostname = "new-system";
    username = "your-username"; # Optional, defaults to "w"
  };
};
```

### Adding a Darwin (macOS) System

1. Create a new directory under `hosts/darwin/<hostname>` with your system configuration
2. Add your system to the `darwinConfigurations` in `flake.nix`:

```nix
darwinConfigurations = {
  macbook = lib.mkDarwinConfig {
    system = "aarch64-darwin"; # or "x86_64-darwin"
    hostname = "macbook";
    username = "your-username"; # Optional, defaults to "w"
  };
};
```

## Usage

### NixOS

```bash
# Build and switch to configuration
sudo nixos-rebuild switch --flake .#hostname

# Build and test configuration without switching
sudo nixos-rebuild test --flake .#hostname
```

### Darwin (macOS)

```bash
# Build and switch to configuration
darwin-rebuild switch --flake .#hostname

# Build and test configuration without switching
darwin-rebuild build --flake .#hostname
```

## License

See the [LICENSE](LICENSE) file for details.
