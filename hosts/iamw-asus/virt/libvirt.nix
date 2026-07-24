{
  pkgs,
  ...
}:
{
  programs.virt-manager.enable = true;
  virtualisation.spiceUSBRedirection.enable = true;
  virtualisation.libvirtd = {
    enable = true;
    qemu = {
      package = pkgs.qemu_kvm;
      runAsRoot = true;
      swtpm.enable = true;

      verbatimConfig = ''
        cgroup_device_acl = [
            "/dev/null", "/dev/full", "/dev/zero",
            "/dev/random", "/dev/urandom",
            "/dev/ptmx", "/dev/kvm",
            "/dev/kvmfr0"
        ]'';
    };
  };

  environment.systemPackages = with pkgs; [
    looking-glass-client
    OVMF
    qemu
    dnsmasq
    edk2
    (writeShellScriptBin "qemu-system-x86_64-uefi" ''
      qemu-system-x86_64 \
      -bios ${pkgs.OVMF.fd}/FV/OVMF.fd \
      "$@"
    '')
  ];

  environment.persistence."/persistent".directories = [
    "/var/lib/libvirt/images"
    "/var/lib/libvirt/qemu"
  ];
}
