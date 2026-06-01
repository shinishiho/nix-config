{
  inputs,
  pkgs,
  ...
}:

{
  home.packages = with inputs.llm-agents.packages.${pkgs.stdenv.hostPlatform.system}; [
    pi
  ];

  home.persistence."/persistent".directories = [
    ".pi"
  ];
}
