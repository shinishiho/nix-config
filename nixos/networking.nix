{
  networking = {
    hostName = "iamw";
    nameservers = [ "9.9.9.9" "1.1.1.1" ];
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
      dns = "none";
    };

    firewall = {
      enable = false;
      allowedUDPPorts = [ 7011 6001 6000 ];
      allowedTCPPorts = [ 7100 7000 7001 ];
    };
  };

  services.avahi = {
    enable = true;
    nssmdns4 = true;
    publish = {
      enable = true;
      addresses = true;
      domain = true;
      hinfo = true;
      userServices = true;
      workstation = true;
    };
  };
}
