{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        iamw = {
          name = "iamw";
          id = "FJXQNGG-DC6BLDT-MBGCUWQ-GOG5D2U-J4ZW25T-6IFVYJS-AURJOU2-Z35XLAN";
        };

        boox = {
          name = "TabUltraC";
          id = "QL7XQFZ-2DDQ54U-G37KOOQ-SD6EW6C-UL43DAN-ZUKDXNZ-M37XNKY-K3GLWQT";
        };
      };

      folders = {
        "/Users/w/W" = {
          id = "wdata";
          devices = [ "iamw" "boox" ];
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
