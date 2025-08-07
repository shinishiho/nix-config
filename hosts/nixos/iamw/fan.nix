{
  pkgs,
  ...
}:

{
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
