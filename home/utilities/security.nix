{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    # GPG utilities
    pinentry-curses
  ];

  programs = {
    # Security and authentication
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
