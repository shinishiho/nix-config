{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-ocl
    ];
  };

  hardware.opentabletdriver.enable = true;

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services = {
    acpid.enable = true;
    printing.enable = true;

    power-profiles-daemon.enable = false;
    tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 50;

        START_CHARGE_THRESH_BAT0 = 40;
        STOP_CHARGE_THRESH_BAT0 = 80;
      };
    };

    openssh = {
      enable = true;
      settings = {
        PermitRootLogin = "no";
        PasswordAuthentication = false;
      };
    };

    flatpak = {
      enable = true;
    };

    davfs2 = {
      enable = true;
      settings = {
        globalSection = {
          use_locks = false;
        };
      };
    };

    xserver = {
      enable = true;
      desktopManager.gnome.enable = true;
      displayManager.gdm.enable = true;
    };

    udev.extraHwdb = ''
      evdev:atkbd:*
        KEYBOARD_KEY_3a=esc
    '';
  };

  environment.gnome.excludePackages = (with pkgs; [
    gnome-photos
    gnome-tour
    gnome-maps
    gnome-contacts
    gnome-weather
    gnome-calculator
    gnome-calendar
    gnome-text-editor
    simple-scan
    xterm
    gedit # text editor
    cheese # webcam tool
    gnome-music
    gnome-terminal
    epiphany # web browser
    geary # email reader
    evince # document viewer
    gnome-characters
    totem # video player
    tali # poker game
    iagno # go game
    hitori # sudoku game
    atomix # puzzle game
    ]);

  security.sudo.extraConfig = "Defaults env_keep += \"HTTP_PROXY HTTPS_PROXY\"";
  security.polkit.enable = true;
  programs.xwayland.enable = true;

  virtualisation.podman = {
    enable = true;
    dockerCompat = true;
  };

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    wget
  ];

  fonts.packages = with pkgs; [
    nerd-fonts.mononoki
    nerd-fonts.jetbrains-mono
    cascadia-code
    maple-mono-NF
    material-design-icons
    noto-fonts-cjk-sans
  ];

  system.stateVersion = "unstable";
}
