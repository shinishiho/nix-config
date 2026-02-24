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
      src = lib.mkForce (pkgs.fetchFromGitHub {
        owner = "shinishiho";
        repo = "dms-plugin-hass";
        rev = "4a89ea8bacb9b59c79764a5353f7a4057d8e510e";
        sha256 = "sha256-Zxrer2cFYiGrC3+z8crnDboNEh2k7uMtIQNvjfbtbT0=";
      });

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
