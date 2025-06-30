{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.myModules.nixos.services.networking;
in
{
  config = mkIf cfg.enable {
    networking = {
      resolvconf.enable = pkgs.lib.mkForce false;
      dhcpcd.extraConfig = "nohook resolv.conf";
    };

    services = {
      dnscrypt-proxy2 = {
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

      avahi = {
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

      resolved.enable = true;
    };
  };
}
