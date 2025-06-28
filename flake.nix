{
  description = "Ultra reproducible from IAmW";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/master";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";
    nix-homebrew.url = "github:zhaofengli/nix-homebrew";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix";

    # Homebrew Taps

    homebrew-core = {
      url = "github:homebrew/homebrew-core";
      flake = false;
    };
    homebrew-cask = {
      url = "github:homebrew/homebrew-cask";
      flake = false;
    };
  };

  outputs =
    { nixpkgs, ... }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Import our library functions
      lib = import ./lib { inherit inputs nixpkgs; inherit (nixpkgs) lib; };
    in
    {
      packages = forAllSystems (system: 
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ (import ./pkgs) ];
          };
        in
        {
          # Custom packages available through flake
          # Only expose orchis-theme on Linux systems since it's desktop-specific
        } // nixpkgs.lib.optionalAttrs (nixpkgs.lib.hasPrefix "linux" system || system == "x86_64-linux" || system == "aarch64-linux") {
          inherit (pkgs) orchis-theme;
        });

      # Development shell for maintaining this flake
      devShells = forAllSystems (system:
        let
          pkgs = nixpkgs.legacyPackages.${system};
        in
        {
          default = pkgs.mkShell {
            name = "nix-config";
            buildInputs = with pkgs; [
              nixd # Nix language server
              nil # Another Nix language server
              nixpkgs-fmt # Nix formatter
              deadnix # Find dead Nix code
              statix # Lints and suggestions for Nix
            ];
            shellHook = ''
              echo "🚀 Welcome to the nix-config development environment!"
              echo "Available tools:"
              echo "  - nixd/nil: Language servers for Nix"
              echo "  - nixpkgs-fmt: Format Nix files"
              echo "  - deadnix: Find unused Nix code"
              echo "  - statix: Lint Nix files"
            '';
          };
        });

      # overlays = import ./pkgs;

      nixosConfigurations = {
        iamw = lib.mkNixosConfig {
          system = "x86_64-linux";
          hostname = "iamw";
        };

        # Add more NixOS configurations here using the helper function
        # example-aarch64 = lib.mkNixosConfig {
        #   system = "aarch64-linux";
        #   hostname = "example-aarch64";
        #   username = "differentuser"; # optional
        # };
      };

      # Darwin configurations
      darwinConfigurations = {
        iamw-m1 = lib.mkDarwinConfig {
          system = "aarch64-darwin";
          hostname = "iamw-m1";
        };
      };
    };
}
