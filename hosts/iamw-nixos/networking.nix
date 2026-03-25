{
  networking = {
    hostName = "iamw-nixos";
    networkmanager = {
      enable = true;
    };

    firewall = {
      enable = true;
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

    nftables = {
      enable = true;
    };

    interfaces = {
      enp10s0 = {
        wakeOnLan.enable = true;
      };
    };
  };
}
