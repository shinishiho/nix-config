{
  services = {
    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };
  };

  security.sudo = {
    execWheelOnly = true;
    wheelNeedsPassword = false;
    extraConfig = "Defaults pwfeedback";
  };
}
