{
  config,
  lib,
  pkgs,
  ...
}:

{
  programs.dank-material-shell.plugins = {
    homeAssistantMonitor = {
      enable = true;
      settings = {
        hassUrl = "http://rpiamw:8123";
        hassTokenPath = "/run/user/1000/agenix/hass-longlive-token";
        entityIds = "switch.fan, light.livingroom_kitchen_light, light.livingroom_kitchen_light_3, light.livingroom_kitchen_light_2, switch.bathroom_switch, switch.bathroom_switch_2, script.ac_fan_only, climate.big_ac";
        pinnedEntities = [ ];
        customIcons = {
          "switch.fan" = "mode_fan";
          "light.livingroom_kitchen_light_3" = "kitchen";
        };
      };
    };
  };
}
