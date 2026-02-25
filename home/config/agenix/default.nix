{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.agenix.homeManagerModules.default
  ];

  age = {
    identityPaths = [
      "${config.home.homeDirectory}/.ssh/id_ed25519"
    ];
    secrets = {
      hass-longlive-token = {
        file = ./hass-longlive-token.age;
      };
    };
  };

  home.packages = with pkgs; [
    inputs.agenix.packages.${pkgs.system}.default
  ];
}
