{
  inputs,
  pkgs,
  ...
}:

{
  users.users.w = {
    home = "/Users/w";
    name = "w";
    shell = pkgs.fish;
    openssh.authorizedKeys.keys = [

    ];
  };

  programs.fish.enable = true;

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit (inputs.self) outputs;
    };
    users.w = {
      imports = [
        ./home.nix
      ];
    };
  };
}
