{
  networking = {
    hostName = "iamw";
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };

    firewall = {
      #enable = false;
      allowedUDPPorts = [
        7011
        6001
        6000
      ];
      allowedTCPPorts = [
        7100
        7000
        7001
      ];
    };
  };
}