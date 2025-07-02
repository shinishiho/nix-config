{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    hyprpanel
  ];

  home.file.".config/hyprpanel/config.json".text = ''
{
  "bar.customModules.storage.paths": [
    "/"
  ],
  "theme.font.name": "CaskaydiaCove Nerd Font Propo",
  "theme.font.style": "italic",
  "theme.font.label": "CaskaydiaCove Nerd Font Propo Semi-Light Italic",
  "theme.bar.floating": false,
  "bar.autoHide": "never",
  "theme.bar.buttons.enableBorders": false,
  "theme.bar.enableShadow": false,
  "theme.osd.enable": true,
  "menus.volume.raiseMaximumVolume": true,
  "menus.clock.weather.enabled": false,
  "bar.layouts": {
    "0": {
      "left": [
        "dashboard",
        "workspaces",
        "windowtitle"
      ],
      "middle": [
        "clock",
        "notifications"
      ],
      "right": [
        "media",
        "volume",
        "network",
        "bluetooth",
        "battery",
        "systray"
      ]
    },
    "1": {
      "left": [
        "dashboard",
        "workspaces",
        "windowtitle"
      ],
      "middle": [
        "media"
      ],
      "right": [
        "volume",
        "clock",
        "notifications"
      ]
    },
    "2": {
      "left": [
        "dashboard",
        "workspaces",
        "windowtitle"
      ],
      "middle": [
        "media"
      ],
      "right": [
        "volume",
        "clock",
        "notifications"
      ]
    }
  },
  "theme.bar.buttons.dashboard.enableBorder": false,
  "theme.bar.transparent": true,
  "theme.font.size": "1rem",
  "bar.customModules.netstat.dynamicIcon": true,
  "bar.customModules.netstat.label": true,
  "bar.customModules.netstat.rateUnit": "MiB",
  "bar.customModules.netstat.labelType": "full",
  "theme.bar.buttons.modules.power.enableBorder": false,
  "bar.customModules.netstat.leftClick": "menu:network",
  "theme.bar.buttons.modules.kbLayout.enableBorder": false,
  "menus.power.showLabel": true,
  "menus.power.lowBatteryNotification": true,
  "menus.clock.time.military": true,
  "menus.clock.time.hideSeconds": true,
  "menus.clock.weather.location": "Ho Chi Minh",
  "menus.clock.weather.unit": "metric",
  "theme.matugen": true,
  "theme.bar.menus.monochrome": false,
  "bar.workspaces.show_icons": false,
  "bar.workspaces.show_numbered": false,
  "bar.workspaces.showWsIcons": true,
  "bar.workspaces.workspaceIconMap": {
    "1": {
      "icon": "",
      "color": "#a6e3a1"
    },
    "2": {
      "icon": "",
      "color": "#74c7ec"
    },
    "3": {
      "icon": "",
      "color": "#fab387"
    },
    "4": {
      "icon": "",
      "color": "#f5c2e7"
    },
    "5": {
      "icon": "",
      "color": "#f38ba8"
    },
    "6": {
      "icon": "",
      "color": "#cba6f7"
    },
    "7": {
      "icon": "",
      "color": "#f5e0dc"
    },
    "8": {
      "icon": "",
      "color": "#f2cdcd"
    }
  },
  "bar.workspaces.workspaces": 8,
  "theme.bar.buttons.clock.enableBorder": false,
  "bar.clock.showIcon": true,
  "bar.notifications.hideCountWhenZero": true,
  "bar.notifications.show_total": true,
  "menus.media.displayTimeTooltip": true,
  "menus.media.displayTime": true,
  "wallpaper.enable": false,
  "wallpaper.image": "/home/w/.config/wallpaper/active",
  "theme.matugen_settings.mode": "dark"
}
'';
}