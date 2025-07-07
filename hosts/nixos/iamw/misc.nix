{
  pkgs,
  inputs,
  ...
}:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-intel
    inputs.nixos-hardware.nixosModules.common-pc-ssd
    inputs.nixos-hardware.nixosModules.common-pc-laptop

    inputs.nixos-hardware.nixosModules.asus-battery
  ];

  hardware.graphics = {
    extraPackages = with pkgs; [
      intel-media-driver
      intel-ocl
    ];
  };

  hardware.asus.battery.chargeUpto = 60;

  services = {
    power-profiles-daemon.enable = true;
    upower.enable = true;
    printing.enable = true;
  };

  services.udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
'';
}
