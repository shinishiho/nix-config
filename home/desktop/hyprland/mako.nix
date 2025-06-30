{
  services.mako = {
    enable = true;

    settings = {
      anchor = "top-center";
      default-timeout = 5000;
      group-by = "app-name";

      width = 500;
      height = 200;

      layer = "overlay";
      border-size = 4;
      border-radius = 7;
      font = "CaskaydiaCove Nerd Font 12";
      format = "<b>%a</b>\\n<b>%s</b>\\n%b";

      background-color = "#24273a";
      border-color = "#f0c6c6";
      text-color = "#cad3f5";
      progress-color = "over #363a4f";
    };

    extraConfig = ''
      [urgency=high]
      border-color=#f5a97f
    '';
  };
}
