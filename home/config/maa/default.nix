{
  pkgs,
  ...
}:

{
  home.packages = with pkgs; [
    maa
  ];

  home.file = {
    ".config/maa/cli.toml".source = ./cli.toml;
    ".config/maa/tasks/daily.toml".source = ./daily.toml;
    ".config/maa/tasks/rock.toml".source = ./rock.toml;

    ".config/maa/profiles/default.toml".text = ''
      [connection]
      preset = "Waydroid"
      adb_path = "${pkgs.android-tools}/bin/adb"
      address = "192.168.240.112:5555"

      [resource]
      global_resource = "YoStarEN"
      user_resource = false

      [static_options]
      cpu_ocr = false
      gpu_ocr = 1

      [instance_options]
      touch_mode = "MaaTouch"
      deployment_with_pause = false
      adb_lite_enabled = false
      kill_adb_on_exit = false
    '';
    ".config/maa/resource/tasks.json".source = ./tasks.json;
  };
}
