{
  description = "Ultra reproducible from IAmW";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    nix-darwin.url = "github:nix-darwin/nix-darwin/master";
    nix-darwin.inputs.nixpkgs.follows = "nixpkgs";

    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";

    home-manager.url = "github:nix-community/home-manager/master";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    impermanence.url = "github:nix-community/impermanence";

    nixvim.url = "github:nix-community/nixvim";
    nixvim.inputs.nixpkgs.follows = "nixpkgs";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprpanel = {
      url = "github:Jas-SinghFSU/HyprPanel";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";

    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix";

    zen-browser = {
      url = "github:0xc000022070/zen-browser-flake";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    plover-flake.url = "github:openstenoproject/plover-flake";

    helium.url = "github:FKouhai/helium2nix/main";

    NixVirt = {
      url = "https://flakehub.com/f/AshleyYakeley/NixVirt/*.tar.gz";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    dw-proton.url = "github:Momoyaan/dwproton-flake";

    nixgl.url = "github:nix-community/nixGL";
    nixgl.inputs.nixpkgs.follows = "nixpkgs";
    
  };

  outputs =
    { nixpkgs, nix-darwin, home-manager, chaotic, ... }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems (system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = [ (import ./pkgs) ];
          };
        in {
          inherit pkgs;
          maa = pkgs.maa;
          orchis-theme = pkgs.orchis-theme;
        });
    in {
      packages = forAllSystems;      

      nixosConfigurations.iamw = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit nixpkgs home-manager chaotic inputs; hostname = "iamw"; };
        modules = [
          ./hosts/iamw
          home-manager.nixosModules.home-manager
          chaotic.nixosModules.default
        ];
      };

      # darwinConfigurations.iamw-m1 = nix-darwin.lib.darwinSystem {
      #   system = "aarch64-darwin";
      #   specialArgs = { inherit nixpkgs home-manager inputs; hostname = "iamw-m1"; };
      #   modules = [
      #     ./hosts/aarch64-darwin/iamw-m1
      #     home-manager.darwinModules.home-manager
      #   ];
      # };

      # Standalone Home Manager configuration for non-NixOS systems (Arch, etc.)
      homeConfigurations.w = home-manager.lib.homeManagerConfiguration {
        pkgs = nixpkgs.legacyPackages.x86_64-linux;
        extraSpecialArgs = { inherit inputs; };
        modules = [
          {
            nixpkgs.config.allowUnfree = true;
            nixpkgs.overlays = [
              (import ./pkgs)
              inputs.nixgl.overlay
            ];
          }
          # Stub for impermanence - makes home.persistence a no-op on non-NixOS
          {
            options.home.persistence = nixpkgs.lib.mkOption {
              type = nixpkgs.lib.types.attrsOf (nixpkgs.lib.types.anything);
              default = {};
              description = "Persistence configuration (no-op on non-NixOS)";
            };
          }
          ./hosts/iamw/users/w/home.nix
        ];
      };

      devShells = nixpkgs.lib.genAttrs supportedSystems (
        system:
        let
          pkgs = (forAllSystems.${system}).pkgs;
        in
        {
          default = pkgs.mkShellNoCC {
            packages = with pkgs; [
              nixd
              cachix
              # lorri
              # niv
              nixfmt
              statix
              # vulnix
              # haskellPackages.dhall-nix
            ];
          };
        }
      );
    };
}
