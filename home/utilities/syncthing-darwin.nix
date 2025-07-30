{
  services.syncthing = {
    enable = true;
    settings = {
      devices = {
        iamw = {
          name = "iamw";
          id = "CVHWLIS-PQFY2KD-KOHKBR4-C6QJYTP-JNB33CD-F2T3N5G-LQ3ELNE-NNNNKQW";
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
