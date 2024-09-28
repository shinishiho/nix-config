{ pkgs, ... }: {
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver
      intel-ocl
    ];
  };

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
  };

  services = {
    acpid.enable = true;
    printing.enable = true;

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

    davfs2 = {
      enable = true;
      settings = {
        globalSection = {
          use_locks = false;
        };
      };
    };
  };

  programs.xwayland.enable = true;

  environment.systemPackages = with pkgs; [
    acpi
    brightnessctl
    wget
  ];

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [
      "CascadiaCode"
      "JetBrainsMono"
      "Mononoki"
      ];
    })
    maple-mono-NF
    material-design-icons
    noto-fonts-cjk-sans
  ];

  system.stateVersion = "unstable";
}
