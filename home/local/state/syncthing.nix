{
  services.syncthing = {
    enable = true;
    overrideDevices = false;
    overrideFolders = false;

    settings = {
      gui = {
        theme = "black";
      };
    };
  };

  home.persistence = {
    "/persistent" = {
      directories = [
        ".local/state/syncthing"
      ];
    };
  };
}
