{
  config,
  ...
}:
let
  nvidia_device_ids = "10de:1e89,10de:10f8,10de:1ad8,10de:1ad9";
in
{
  boot = {
    initrd.kernelModules = [
      "vfio_pci"
      "vfio"
      "vfio_iommu_type1"
      "kvmfr"
      "xe"
      "nouveau"
    ];
    kernelParams = [
      "nvidia.runpm=0"
      "nvidia.modeset=0"
      "nouveau.runpm=0"
      "nouveau.modeset=0"
      "intel_iommu=on"
      "vfio-pci.ids=${nvidia_device_ids}"
    ];

    extraModulePackages = [
      config.boot.kernelPackages.kvmfr
    ];
    extraModprobeConfig = ''
      options kvmfr static_size_mb=32
    '';
  };

  services.udev.extraRules = ''
    SUBSYSTEM=="kvmfr", GROUP="kvm", MODE="0660"
  '';
}
