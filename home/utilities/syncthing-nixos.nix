{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        nakxkri = {
          name = "NakXKri";
          id = "4QBAGA4-CB5RSSY-KPP2PER-JEWDDAA-TROXRCT-K4IOKE7-OTHPWTA-RJL4VAA";
        };
      };

      folders = {
        "/home/w/W" = {
          id = "wdata";
          devices = [ "nakxkri" ];
          versioning = {
            type = "simple";
            params.keep = "10";
          };
        };
      };

      gui = {
        theme = "black";
      };
    };
  };

  home.persistence = {
    "/persistent/home/w" = {
      directories = [
        ".local/state/syncthing"
      ];
    };
  };
}
