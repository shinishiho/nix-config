{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        iamw = {
          name = "iamw";
          id = "FJXQNGG-DC6BLDT-MBGCUWQ-GOG5D2U-J4ZW25T-6IFVYJS-AURJOU2-Z35XLAN";
        };
      };

      folders = {
        "/Users/w/W" = {
          id = "wdata";
          devices = [ "iamw" ];
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
