{ ... }:

{
  imports = [
    ./w.nix
    ./vgu.nix
    ./leisure.nix
  ];

  programs.zen-browser.profiles."Default (release)" = {
    containersForce = true;
    spacesForce = true;
    pinsForce = true;
  };
}
