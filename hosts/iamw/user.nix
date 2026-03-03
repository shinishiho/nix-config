{
  inputs,
  pkgs,
  ...
}:

{
  users.mutableUsers = false;
  users.users = {
    w = {
      hashedPassword = "$y$j9T$6SivXfiRqM0PSlgKvZtUX0$btXti2PEXQr8pXE23NhrIiIQze3JECtNVwXBb5q3gw2";
      isNormalUser = true;
      openssh.authorizedKeys.keys = [
        # TODO: Add your SSH public key(s) here, if you plan on using SSH to connect
      ];
      extraGroups = [
        "adbusers"
        "dialout"
        "docker"
        "input"
        "kvm"
        "libvirtd"
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

    fuse.userAllowOther = true;
    dconf.enable = true;
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

  environment.pathsToLink = [ "/share/applications" "/share/xdg-desktop-portal" ];
}
