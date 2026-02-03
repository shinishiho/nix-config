_final: prev: {
  orchis-theme = prev.callPackage ./orchis-themes.nix { };
  maa = prev.callPackage ./maa.nix { };
  # Add other custom packages here
}
