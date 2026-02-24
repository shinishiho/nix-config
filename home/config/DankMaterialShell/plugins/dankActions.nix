{
  programs.dank-material-shell.plugins = {
    dankActions = {
      enable = true;
      settings = {
        variants = [
          {
            icon = "mode_fan";
            displayText = "";
            displayCommand = "cat /sys/devices/platform/asus-nb-wmi/hwmon/hwmon*/pwm1_enable";
            clickCommand = "echo 0 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon*/pwm1_enable > /dev/null";
            middleClickCommand = "";
            rightClickCommand = "echo 2 | sudo tee /sys/devices/platform/asus-nb-wmi/hwmon/hwmon*/pwm1_enable > /dev/null";
            updateInterval = 0;
            showIcon = true;
            showText = true;
            visibilityCommand = "";
            visibilityInterval = 0;
            id = "variant_1771580197754";
            name = "Fan";
          }
        ];
      };
    };
  };
}
