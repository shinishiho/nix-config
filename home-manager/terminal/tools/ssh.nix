{
  programs.ssh = {
    enable = true;
    addKeysToAgent = "confirm";
    compression = true;
    extraConfig = "ForwardX11 yes";
  };
}
