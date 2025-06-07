{
  description = "Ultra reproducible from IAmW";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/master";

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
  };

  outputs =
    { self, nixpkgs, ... }@inputs:
    let
      inherit (self) outputs;
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems;

      # Function to create system-specific pkgs
      mkPkgs =
        system:
        import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [
            (import ./pkgs)
            # Add other overlays here
          ];
        };

      mkNixosConfig =
        {
          system,
          hostname,
          username,
        }:
        nixpkgs.lib.nixosSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nixos/${hostname}

            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs outputs;
                  platform = "linux";
                };
                users.${username} = {
                  imports = [
                    ./home/platforms/nixos/users/${username}
                  ];
                };
              };
            }
          ];
        };

      mkDarwinConfig =
        {
          system,
          hostname,
          username,
        }:
        nixpkgs.lib.darwinSystem {
          inherit system;
          specialArgs = { inherit inputs outputs; };
          modules = [
            # Host-specific configuration
            ./hosts/darwin/${hostname}

            # Common Darwin modules
            ./modules/darwin
            ./modules/shared

            # Home-manager configuration
            inputs.home-manager.darwinModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs outputs;
                  platform = "darwin";
                };
                users.${username} =
                  { ... }:
                  {
                    imports = [
                      ./modules/home-manager.nix
                      ./home
                    ];
                  };
              };
            }
          ];
        };
    in
    {
      packages = forAllSystems (system: {
        # Custom packages available through flake
        inherit (mkPkgs system) orchis-theme;
      });

      # overlays = import ./pkgs;

      nixosConfigurations = {
        iamw = mkNixosConfig {
          system = "x86_64-linux";
          hostname = "iamw";
          username = "w";
        };

        # Add more NixOS configurations here
        # example-aarch64 = mkNixosConfig {
        #   system = "aarch64-linux";
        #   hostname = "example-aarch64";
        # };
      };

      # Darwin configurations (when you're ready to add them)
      darwinConfigurations = {
        # Uncomment and customize when adding macOS systems
        # macbook = mkDarwinConfig {
        #   system = "aarch64-darwin";
        #   hostname = "macbook";
        # };
      };
    };
}
