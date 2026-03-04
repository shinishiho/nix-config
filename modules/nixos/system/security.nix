{
  pkgs,
  ...
}:

{
  security = {
    polkit.enable = true;
    sudo = {
      execWheelOnly = true;
      wheelNeedsPassword = false;
      extraConfig = "Defaults pwfeedback";
    };
  };
}
