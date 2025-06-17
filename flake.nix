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
    in
    {
      packages = forAllSystems (system: {
        # Custom packages available through flake
        inherit (import nixpkgs {
          inherit system;
          config.allowUnfree = true;
          overlays = [ (import ./pkgs) ];
        }) orchis-theme;
      });

      # overlays = import ./pkgs;

      nixosConfigurations = {
        iamw = nixpkgs.lib.nixosSystem {
          system = "x86_64-linux";
          specialArgs = { inherit inputs outputs; };
          modules = [
            ./hosts/nixos/iamw

            inputs.home-manager.nixosModules.home-manager
            {
              home-manager = {
                useGlobalPkgs = true;
                useUserPackages = true;
                extraSpecialArgs = {
                  inherit inputs outputs;
                  platform = "linux";
                };
                users.w = {
                  imports = [
                    ./home/platforms/nixos/users/w
                  ];
                };
              };
            }
          ];
        };

        # Add more NixOS configurations here
        # example-aarch64 = nixpkgs.lib.nixosSystem {
        #   system = "aarch64-linux";
        #   specialArgs = { inherit inputs outputs; };
        #   modules = [
        #     ./hosts/nixos/example-aarch64
        #     # ... other modules
        #   ];
        # };
      };

      # Darwin configurations (when you're ready to add them)
      darwinConfigurations = {
        # Uncomment and customize when adding macOS systems
        # macbook = nixpkgs.lib.darwinSystem {
        #   system = "aarch64-darwin";
        #   specialArgs = { inherit inputs outputs; };
        #   modules = [
        #     ./hosts/darwin/macbook
        #     ./modules/darwin
        #     ./modules/shared
        #     inputs.home-manager.darwinModules.home-manager
        #     {
        #       home-manager = {
        #         useGlobalPkgs = true;
        #         useUserPackages = true;
        #         extraSpecialArgs = {
        #           inherit inputs outputs;
        #           platform = "darwin";
        #         };
        #         users.username = {
        #           imports = [
        #             ./modules/home-manager.nix
        #             ./home
        #           ];
        #         };
        #       };
        #     }
        #   ];
        # };
      };
    };
}
