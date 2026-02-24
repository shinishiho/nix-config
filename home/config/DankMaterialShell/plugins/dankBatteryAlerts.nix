{
  programs.dank-material-shell.plugins = {
    dankBatteryAlerts = {
      enable = true;
      settings = {
        criticalThreshold = 15;
        criticalTitle = "I'm dying bro";
        criticalMessage = "\${level}% left.";
        warningTitle = "Onaka ga suita";
        warningThreshold = 25;
        warningMessage = "\${level}% left.";
      };
    };
  };
}
