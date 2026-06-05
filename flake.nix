{
  description = "Ultra reproducible from IAmW";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/master";
    chaotic.url = "github:chaotic-cx/nyx/nyxpkgs-unstable";

    nix-darwin = {
      url = "github:nix-darwin/nix-darwin/master";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager.url = "github:nix-community/home-manager/master";

    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    impermanence.url = "github:nix-community/impermanence";

    nixvim.url = "github:nix-community/nixvim";

    hyprland.url = "github:hyprwm/Hyprland";
    hyprpanel.url = "github:Jas-SinghFSU/HyprPanel";

    niri.url = "github:sodiboo/niri-flake";

    dms.url = "github:shinishiho/DankMaterialShell";
    dms-plugin-registry.url = "github:AvengeMedia/dms-plugin-registry";
    dsearch.url = "github:AvengeMedia/danksearch";

    niri-float-sticky.url = "github:probeldev/niri-float-sticky";

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
    nix-index-database = {
      url = "github:nix-community/nix-index-database";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    agenix.url = "github:ryantm/agenix";

    zen-browser.url = "github:0xc000022070/zen-browser-flake";
    nix-firefox-addons.url = "github:osipog/nix-firefox-addons";

    plover-flake.url = "github:openstenoproject/plover-flake";

    dw-proton.url = "github:Momoyaan/dwproton-flake";

    nixGL.url = "github:nix-community/nixGL";

    lanzaboote = {
      url = "github:nix-community/lanzaboote/v1.0.0";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    llm-agents.url = "github:numtide/llm-agents.nix";
  };

  outputs =
    {
    nixpkgs,
    nix-darwin,
    home-manager,
    chaotic,
    ...
    }@inputs:
    let
      supportedSystems = [
        "x86_64-linux"
        "aarch64-linux"
        "aarch64-darwin"
        "x86_64-darwin"
      ];
      nixpkgsOverlays = [
        (import ./pkgs)
        inputs.niri.overlays.niri
        inputs.nix-firefox-addons.overlays.default
      ];
      forAllSystems = nixpkgs.lib.genAttrs supportedSystems (
        system:
        let
          pkgs = import nixpkgs {
            inherit system;
            config.allowUnfree = true;
            overlays = nixpkgsOverlays;
          };
        in
          {
          inherit pkgs;
          maa = pkgs.maa;
          orchis-theme = pkgs.orchis-theme;
        }
      );
    in
      {
      packages = forAllSystems;

      nixosConfigurations.iamw-asus = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit nixpkgs home-manager chaotic inputs; };
        modules = [
          ./hosts/iamw-asus
          home-manager.nixosModules.home-manager
          chaotic.nixosModules.default
        ];
      };

      nixosConfigurations.iamw-nixos = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        specialArgs = { inherit nixpkgs home-manager chaotic inputs; };
        modules = [
          ./hosts/iamw-nixos
          home-manager.nixosModules.home-manager
          chaotic.nixosModules.default
        ];
      };

      darwinConfigurations.iamw-m1mini = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit nixpkgs home-manager inputs; hostName = "iamw-m1mini"; };
        modules = [
          ./hosts/iamw-m1
          home-manager.darwinModules.home-manager
        ];
      };

      darwinConfigurations.iamw-m1air = nix-darwin.lib.darwinSystem {
        system = "aarch64-darwin";
        specialArgs = { inherit nixpkgs home-manager inputs; hostName = "iamw-m1air"; };
        modules = [
          ./hosts/iamw-m1
          home-manager.darwinModules.home-manager
        ];
      };

      homeConfigurations.w = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          overlays = nixpkgsOverlays;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [
          {
            options.home.persistence = nixpkgs.lib.mkOption {
              type = nixpkgs.lib.types.attrsOf (nixpkgs.lib.types.anything);
              default = { };
              description = "Impermanence no-op on non-NixOS";
            };
          }
          {
            targets.genericLinux.enable = true;
            targets.genericLinux.nixGL.packages = inputs.nixGL.packages;
          }
          ./home/nixos.nix
        ];
      };

      homeConfigurations.headless-w = home-manager.lib.homeManagerConfiguration {
        pkgs = import nixpkgs {
          system = "x86_64-linux";
          config.allowUnfree = true;
          overlays = nixpkgsOverlays;
        };
        extraSpecialArgs = { inherit inputs; };
        modules = [
          {
            options.home.persistence = nixpkgs.lib.mkOption {
              type = nixpkgs.lib.types.attrsOf (nixpkgs.lib.types.anything);
              default = { };
              description = "Impermanence no-op on non-NixOS";
            };
          }
          {
            targets.genericLinux.enable = true;
            targets.genericLinux.nixGL.packages = inputs.nixGL.packages;
          }
          ./home/headless.nix
        ];
      };
    };
}
