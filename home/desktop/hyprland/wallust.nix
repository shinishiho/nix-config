{
  programs.wallust = {
    enable = true;
    settings = {
      backend = "fastresize";
      check_contrast = true;
      color_space = "lch";
      pallete = "dark";
      templates = {
        vscode = {
          src = "vscode.json";
          dst = "~/.cache/wallust/colors.json";
        };
        vscode2 = {
          src = "vscode";
          dst = "~/.cache/wallust/colors";
        };
        hypr = {
          src = "hypr.conf";
          dst = "~/.config/hypr/colors.conf";
        };
        kitty = {
          src = "kitty.conf";
          dst = "~/.config/kitty/colors.conf";
        };
        rofi = {
          src = "rofi-theme.rasi";
          dst = "~/.config/rofi/theme.rasi";
        };
      };
    };
  };

  home.file = {
    ".config/wallust/templates/vscode.json".text = ''
{
    "checksum": ":)",
    "wallpaper": "{{wallpaper}}",
    "alpha": "100",

    "special": {
        "background": "{{background}}",
        "foreground": "{{foreground}}",
        "cursor": "{{cursor}}"
    },
    "colors": {
        "color0": "{{color0}}",
        "color1": "{{color1}}",
        "color2": "{{color2}}",
        "color3": "{{color3}}",
        "color4": "{{color4}}",
        "color5": "{{color5}}",
        "color6": "{{color6}}",
        "color7": "{{color7}}",
        "color8": "{{color8}}",
        "color9": "{{color9}}",
        "color10": "{{color10}}",
        "color11": "{{color11}}",
        "color12": "{{color12}}",
        "color13": "{{color13}}",
        "color14": "{{color14}}",
        "color15": "{{color15}}"
    }
}
    '';

    ".config/wallust/templates/vscode".text = ''
{{color0}}
{{color1}}
{{color2}}
{{color3}}
{{color4}}
{{color5}}
{{color6}}
{{color7}}
{{color8}}
{{color9}}
{{color10}}
{{color11}}
{{color12}}
{{color13}}
{{color14}}
{{color15}}
   '';

    ".config/wallust/templates/hypr.conf".text = ''
general {
    col.active_border = rgb({{color1 | saturate(0.6) | strip}}) rgb({{color2 | saturate(0.6) | strip}}) rgb({{color3 | saturate(0.6) | strip}}) rgb({{color4 | saturate(0.6) | strip}}) rgb({{color5 | saturate(0.6) | strip}}) rgb({{color6 | saturate(0.6) | strip}})
    col.inactive_border = rgba({{color0 | strip}}ee)
}
'';

    ".config/wallust/templates/kitty.conf".text = ''
cursor {{ cursor }}

background {{ background }}
foreground {{ foreground }}

color0 {{ color0 }}
color1 {{ color1 }}
color2 {{ color2 }}
color3 {{ color3 }}
color4 {{ color4 }}
color5 {{ color5 }}
color6 {{ color6 }}
color7 {{ color7 }}
color8 {{ color8 }}
color9 {{ color9 }}
color10 {{ color10 }}
color11 {{ color11 }}
color12 {{ color12 }}
color13 {{ color13 }}
color14 {{ color14 }}
color15 {{ color15 }}

mark1_foreground {{ color6 | saturate(0.2) }}
mark2_foreground {{ color7 | saturate(0.2) }}
mark3_foreground {{ color6 | saturate(0.2) }}
    '';

    ".config/wallust/templates/rofi-theme.rasi".text = ''
* {
    main-bg:            {{ background }}B3;
    main-fg:            {{ foreground }}E6;
    main-br:            {{ color10 }}E6;
    main-ex:            {{ color11 }}E6;
    select-bg:          {{ color2 }}80;
    select-fg:          {{ color3 }}E6;
}
    '';
  };
}