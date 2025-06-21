{
  inputs,
  ...
}:
{
  nix-homebrew = {
    enable = true;
    enableRosetta = false;
    user = "w";
    taps = {
      "homebrew/homebrew-core" = inputs.homebrew-core;
      "homebrew/homebrew-cask" = inputs.homebrew-cask;
    };
    mutableTaps = false;
  };

  homebrew = {
    enable = true;
    onActivation.autoUpdate = true;
    onActivation.upgrade = true;

    brews = [
    ];

    casks = [
      "zen"
      "visual-studio-code"
    ];
  };
}