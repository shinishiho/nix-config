{
  fileSystems."/" = {
    device = "none";
    fsType = "tmpfs";
    options = [ "defaults" "size=50%" "mode=755" ];
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

  environment.persistence."/persistent" = {
    hideMounts = true;
    directories = [
      "/var/log"
      "/var/lib/bluetooth"
      "/var/lib/flatpak"
      "/var/lib/nixos"
      "/var/lib/systemd/coredump"
      "/etc/NetworkManager/system-connections"
      { directory = "/var/lib/colord"; user = "colord"; group = "colord"; mode = "u=rwx,g=rx,o="; }
    ];
    files = [
      "/etc/machine-id"
      "/etc/davfs2/secrets"
      { file = "/var/keys/secret_file"; parentDirectory = { mode = "u=rwx,g=,o="; }; }
    ];
    users.w = {
      directories = [
        "Downloads"
        { directory = ".gnupg"; mode = "0700"; }
        { directory = ".ssh"; mode = "0700"; }
        { directory = ".nixops"; mode = "0700"; }
        { directory = ".local/share/keyrings"; mode = "0700"; }
        ".config/fcitx5"
        ".config/nekoray"
        ".cache/flatpak"
        ".local/share/flatpak"
        ".local/share/direnv"
        ".local/share/zoxide"
        ".local/share/zed"
        ".vim/undodir"
        ".var/app/io.github.zen_browser.zen/.zen"
        ".var/app/io.itch.itch"
        ".steam"
        ".thunderbird"
        ".zen"
      ];
      files = [
        ".zsh_history"
        ".local/share/nvim/file_frecency.bin"
      ];
    };
  };
}
