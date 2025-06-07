{
  programs.rclone = {
    enable = true;
    remotes = {
      proton = {
        config = {
          type = "protondrive";
          username = "shinishihoi";
        };
        secrets.password = "/run/secrets/rclone";
      };
    };
  };
}
