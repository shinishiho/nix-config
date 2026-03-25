{ ... }:

{
  imports = [
    ./w.nix
    ./vgu.nix
    ./leisure.nix
  ];

  programs.zen-browser.profiles.default = {
    containersForce = true;
    spacesForce = true;
    pinsForce = true;
  };
}
