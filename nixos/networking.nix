{
  inputs,
  outputs,
  lib,
  config,
  pkgs,
  ...
}: {
  networking = {
    hostName = "iamw";
    nameservers = [ "127.0.0.1" "::1" ];
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

  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      cache = true;
      cache_size = 4096;
      cache_min_ttl = 2400;
      cache_max_ttl = 86400;
      cache_neg_min_ttl = 60;
      cache_neg_max_ttl = 600;

      sources = {};
      static.AdGuardHome.stamp = "sdns://AgcAAAAAAAAAACBuYqDv1goE2T8vhktURCcXpmbAOMjHBUavYxnk9GovcwxkbnMuaWFtdy50b3AQL2Rucy1xdWVyeS9uaXhvcw";

      fallback_resolvers = ["1.1.1.1" "1.0.0.1"];
    };
  };

  systemd.services.dnscrypt-proxy2.serviceConfig = {
    StateDirectory = "dnscrypt-proxy";
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
