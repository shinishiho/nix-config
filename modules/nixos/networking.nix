{ pkgs, ... }:
{
  # Common networking configuration that can be reused across systems
  networking = {
    # Network Manager is enabled by default
    networkmanager = {
      # DNS settings are moved to host-specific configuration
    };

    # Firewall settings are moved to host-specific configuration
    firewall = {
      # Default is to enable the firewall with no open ports
      enable = true;
    };

    resolvconf.enable = pkgs.lib.mkForce false;
    dhcpcd.extraConfig = "nohook resolv.conf";
  };

  # DNS services
  services.dnscrypt-proxy2 = {
    enable = true;
    settings = {
      ipv6_servers = true;
      require_dnssec = true;

      sources.public-resolvers = {
        urls = [
          "https://raw.githubusercontent.com/DNSCrypt/dnscrypt-resolvers/master/v3/public-resolvers.md"
          "https://download.dnscrypt.info/resolvers-list/v3/public-resolvers.md"
        ];
        cache_file = "/var/lib/dnscrypt-proxy2/public-resolvers.md";
        minisign_key = "RWQf6LRCGA9i53mlYecO4IzT51TGPpvWucNSCh1CBM0QTaLn73Y7GFO3";
      };

      # Default DNS server - can be overridden in host-specific config
      server_names = [ "adguard-dns-doh" ];
    };
  };

  # Avahi service discovery
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

  # systemd-resolved
  services.resolved.enable = true;
}
