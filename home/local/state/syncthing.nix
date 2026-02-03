{
  services.syncthing = {
    enable = false;
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

        rpiamw = {
          name = "rpiamw";
          id = "62XI2DU-K442XC6-27N2QFS-BF3ONCR-JAPKYDI-LXL6TCE-Y5XT2M2-IFEONQO";
        };

        vivo = {
          name = "vivo";
          id = "IKDMWME-EFPJC2F-PEA3WZN-H44OX57-JBH7XOO-PV7MKB3-GXGFJR2-5YDBWAO";
        };
      };

      folders = {
        "/home/w/W" = {
          id = "wdata";
          devices = [ "nakxkri" "boox" "vivo" ];
          versioning = {
            type = "simple";
            params.keep = "10";
          };
        };

        "/home/w/nix-config" = {
          id = "nix-config";
          devices = [ "nakxkri" ];
        };
      };

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
