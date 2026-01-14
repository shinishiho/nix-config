{
  config,
  ...
}:

{
  home.persistence."/persistent".directories = [
    ".config/marimo"
  ];
}
