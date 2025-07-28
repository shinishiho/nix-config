{
  pkgs,
  ...
}:

{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        iamw-m1 = {
          name = "iamw-m1";
          id = "";
        };
        iamw = {
          name = "iamw";
          id = "JDOXSOX-26QVYVA-T675PVR-OQGVG6U-SZJ2QG7-LGWF32D-STMWA3F-H4V4BA7";
        };
      };

      folders = {
        "/home/w/W" = {
          id = "wdata";
          devices = [ "iamw" "iamw-m1" ];
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
}
