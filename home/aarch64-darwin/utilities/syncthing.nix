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

        rpiamw = {
          name = "rpiamw";
          id = "62XI2DU-K442XC6-27N2QFS-BF3ONCR-JAPKYDI-LXL6TCE-Y5XT2M2-IFEONQO";
        };
      };

      folders = {
        "/Users/w/W" = {
          id = "wdata";
          devices = [ "iamw" "boox" "rpiamw" ];
          versioning = {
            type = "simple";
            params.keep = "10";
          };
        };

        "/Users/w/nix-config" = {
          id = "nix-config";
          devices = [ "iamw" ];
        };
      };

      gui = {
        theme = "black";
      };
    };
  };
}
