{ pkgs, ... }: {
  programs.thunderbird = {
    enable = true;

    profiles = {
      "default" = {
        isDefault = true;
        name = "W";
      };
    };
  };
}
