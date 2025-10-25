{
  inputs,
  pkgs,
  ...
}:

{
  users.mutableUsers = false;
  users.users = {
    w = {
      initialPassword = "iamw";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [
        "adbusers"
        "dialout"
        "docker"
        "input"
        "networkmanager"
        "video"
        "wheel"
      ];
      shell = pkgs.fish;
    };
  };

  programs = {
    fish.enable = true;
    weylus = {
      enable = true;
      users = [ "w" ];
      openFirewall = true;
    };

    appimage = {
      enable = true;
      binfmt = true;
    };

    adb.enable = true;
    fuse.userAllowOther = true;
  };

  home-manager = {
    useGlobalPkgs = true;
    useUserPackages = true;
    extraSpecialArgs = {
      inherit inputs;
      inherit (inputs.self) outputs;
    };
    users.w = {
      imports = [
        ./home.nix
      ];
    };
  };
}
