# Host-specific configurations for iamw
{ pkgs, ... }:
{
  # Host-specific networking configuration
  networking = {
    hostName = "iamw";
    nameservers = [
      "127.0.0.1"
      "::1"
    ];
    networkmanager = {
      enable = true;
      wifi.macAddress = "random";
    };

    firewall = {
      # enable = false;
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

  # Host-specific impermanence configuration
  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [
      "defaults"
      "size=50%"
      "mode=755"
    ];
  };

  fileSystems."/persistent" = {
    neededForBoot = true;
    fsType = "btrfs";
    options = [ "subvol=persistent" ];
  };

  fileSystems."/nix" = {
    fsType = "btrfs";
    options = [ "subvol=nix" ];
  };

  fileSystems."/boot" = {
    device = "/dev/disk/by-partlabel/disk-main-ESP";
    fsType = "vfat";
  };

  # Host-specific persistence configuration
  environment.persistence."/persistent" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/docker"
      "/var/lib/nixos"
      "/var/lib/sbctl"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      {
        directory = "/var/lib/colord";
        user = "colord";
        group = "colord";
        mode = "u=rwx,g=rx,o=";
      }
    ];
    files = [
      "/etc/machine-id"
      "/etc/davfs2/secrets"
      {
        file = "/var/keys/secret_file";
        parentDirectory = {
          mode = "u=rwx,g=,o=";
        };
      }
    ];
  };

  # Host-specific hardware configuration
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-ocl
    ];
  };

  # Host-specific system version
  system.stateVersion = "25.05";
} 