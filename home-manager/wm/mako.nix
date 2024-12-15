{
  services.mako = {
    enable = true;
    anchor = "top-center";

    defaultTimeout = 5000;
    groupBy = "app-name";

    width = 500;
    height = 200;

    layer = "overlay";
    borderSize = 4;
    borderRadius = 7;
    font = "CaskaydiaCove Nerd Font 12";
    format = "<b>%a</b>\\n<b>%s</b>\\n%b";

    backgroundColor = "#24273a";
    borderColor = "#f0c6c6";
    textColor = "#cad3f5";
    progressColor = "over #363a4f";

    extraConfig = ''
      [urgency=high]
      border-color=#f5a97f
    '';
  };
}
