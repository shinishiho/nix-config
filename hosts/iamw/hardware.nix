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
    udisks2.enable = true;
    printing.enable = true;

    udev.extraRules = ''
    KERNEL=="uinput", GROUP="input", MODE="0660", OPTIONS+="static_node=uinput"
    '';
  };

  environment.systemPackages = with pkgs; [
    (writeShellScriptBin "fan" ''
#!${pkgs.bash}/bin/bash

current_state=$(cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon?/pwm1_enable)

if [ "$current_state" = "0" ]; then
  echo 2 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon?/pwm1_enable > /dev/null
else
  echo 0 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon?/pwm1_enable > /dev/null
fi
    '')
  ];

  security.sudo.extraRules = [
    {
      users = [ "w" ];
      commands = [
        {
          command = "/run/current-system/sw/bin/tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon*/pwm1_enable";
          options = [ "NOPASSWD" ];
        }
      ];
    }
  ];
}
