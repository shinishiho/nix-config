{
  pkgs,
  ...
}:

let
  gyate = builtins.path {
    name = "gyate";
    path = ./gyate;
  };
in
{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        source = "\$(${pkgs.fd}/bin/fd . '${gyate}' | sort -R | head -n 1)";
        height = 10;
        type = "kitty";
      };

      display = {
        separator = " => ";
        color = {
          separator = "1";
        };
        constants = [
          "──────────────"
        ];
        key = {
          type = "both";
          paddingLeft = 2;
        };
      };

      modules = [
        {
          type = "custom";
          format = "┌{$1} 󰄛  コンピューター {$1}┐";
          outputColor = "blue";
        }
        {
          type = "os";
          key = "OS       ";
          format = "{pretty-name}";
          keyColor = "red";
        }
        {
          type = "kernel";
          key = "Kernel   ";
          format = "{release}";
          keyColor = "red";
        }
        {
          type = "packages";
          key = "Packages ";
          keyColor = "green";
        }
        {
          type = "display";
          key = "Display  ";
          format = "{width}x{height} @ {refresh-rate}Hz [{type}]";
          keyColor = "green";
        }
        {
          type = "wm";
          key = "WM       ";
          format = "{pretty-name}";
          keyColor = "yellow";
        }
        {
          type = "terminal";
          key = "Terminal ";
          keyColor = "yellow";
        }
        {
          type = "shell";
          key = "Shell    ";
          keyColor = "magenta";
        }
        {
          type = "cpu";
          format = "{vendor} [{cores-physical}C/{cores-logical}T] @{freq-max}";
          key = "CPU      ";
          keyColor = "magenta";
        }
        {
          type = "gpu";
          format = "{name} [{core-count}C] @{frequency}";
          key = "GPU      ";
          keyColor = "blue";
        }
        {
          type = "memory";
          key = "Memory   ";
          keyColor = "blue";
        }
        {
          type = "custom";
          format = "└{$1}────────────────────{$1}┘";
        }
        "break"
        {
          type = "colors";
          paddingLeft = 2;
        }
        "break"
      ];
    };
  };
}
