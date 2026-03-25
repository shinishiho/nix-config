{
  inputs,
  ...
}:

{
  imports = [
    inputs.nixos-hardware.nixosModules.common-cpu-amd
    inputs.nixos-hardware.nixosModules.common-pc-ssd
  ];

  services = {
    tlp = {
      enable = true;
      pd.enable = true;
    };
    upower.enable = true;
    udisks2.enable = true;
    printing.enable = true;

    udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
    '';
  };
}
