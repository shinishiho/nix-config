{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        nakxkri = {
          name = "NakXKri";
          id = "4QBAGA4-CB5RSSY-KPP2PER-JEWDDAA-TROXRCT-K4IOKE7-OTHPWTA-RJL4VAA";
        };

        boox = {
          name = "TabUltraC";
          id = "QL7XQFZ-2DDQ54U-G37KOOQ-SD6EW6C-UL43DAN-ZUKDXNZ-M37XNKY-K3GLWQT";
        };
      };

      folders = {
        "/home/w/W" = {
          id = "wdata";
          devices = [ "nakxkri" "boox" ];
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
