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
      "sk-ssh-ed25519@openssh.com AAAAGnNrLXNzaC1lZDI1NTE5QG9wZW5zc2guY29tAAAAICvW6z6WpO3f/eq/mIcrDJLiBH+nJd2CmT8382txKapeAAAABHNzaDo= w@iamw"
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
