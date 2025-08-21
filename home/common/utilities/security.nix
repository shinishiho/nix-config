{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    pinentry-curses
  ];

  programs = {
    ssh = {
      enable = true;
      addKeysToAgent = "confirm";
      compression = true;
      extraConfig = "ForwardX11 yes";
    };

    gpg = {
      enable = true;
    };
  };

  services = {
    gpg-agent = {
      enable = true;
      pinentry.package = pkgs.pinentry-curses;
    };
  };
}
