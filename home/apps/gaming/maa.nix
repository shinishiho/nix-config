{
  config,
  lib,
  pkgs,
  platform ? "linux",
  ...
}:

with lib;

let
  cfg = config.my-apps.gaming.maa;
in
{
  config.home = mkIf cfg.enable ({
    packages = with pkgs; [
      maa-cli
    ];

    file = {
      ".config/maa/cli.toml".text = ''
        # MaaCore install and update  configurations
        [core]
        channel = "Beta" # update channel, can be "Stable", "Beta" or "Alpha"
        test_time = 0 # the time to test download mirrors in seconds, 0 to skip
        # the url to query the latest version of MaaCore, leave it to empty to use default url
        apit_url = "https://github.com/MaaAssistantArknights/maa-cli/raw/version/"
        [core.components]
        library = true # whether install MaaCore library
        resource = true # whether install resource resource

        # CLI update configurations
        [cli]
        channel = "Beta" # update channel, can be "Stable", "Beta" or "Alpha"
        # the url to query the latest version of maa-cli, leave it to empty to use default url
        api_url = "https://github.com/MaaAssistantArknights/maa-cli/raw/version/"
        # the url to download prebuilt binary, leave it to empty to use default url
        download_url = "https://github.com/MaaAssistantArknights/maa-cli/releases/download/"

        [cli.components]
        binary = true # whether install maa-cli binary


        # hot update resource configurations
        [resource]
        auto_update = true # whether auto update resource before running task
        warn_on_update_failure = true # Whether to warn on update failure instead of panic
        backend = "git" # the backend of resource, can be "libgit2" or "git"

        # the remote of resource
        [resource.remote]
        branch = "main" # Branch of remote resource repository
        # URL of remote resource repository, leave it empty to use the default URL
        # url = "git@github.com:MaaAssistantArknights/MaaResource.git"
      '';

      ".config/maa/tasks/daily.toml".text = ''
        #----------------------------- StartUp ----------------------------#
        [[tasks]]
        type = "StartUp"
        params = { client_type = "YoStarEN", start_game_enabled = true }


        #------------------------------ Fight -----------------------------#

        [[tasks]]
        type = "Fight"

        [tasks.params]
        expiring_medicine = 1000

        # On any side story open, fight given side story stage
        [[tasks.variants]]
        condition = { type = "OnSideStory", client = "YoStarEN" }
        params = { stage = "HS-9", series = 0 }

        # Otherwise, fight PR-A-2 on Monday, PR-B-2 on Tuesday, PR-D-2 on Wednesday,
        # PR-C-1 on Thursday, 1-7 for the rest of the week
        [[tasks.variants]]
        condition = { type = "Weekday", weekdays = ["Mon"], timezone = "YoStarEN" }
        params = { stage = "PR-A-2", series = 2 }
        [[tasks.variants]]
        condition = { type = "Weekday", weekdays = ["Tue"], timezone = "YoStarEN" }
        params = { stage = "PR-B-2", series = 2 }
        [[tasks.variants]]
        condition = { type = "Weekday", weekdays = ["Wed"], timezone = "YoStarEN" }
        params = { stage = "PR-D-2", series = 2 }
        [[tasks.variants]]
        condition = { type = "Weekday", weekdays = ["Thu"], timezone = "YoStarEN" }
        params = { stage = "PR-C-2", series = 2 }
        [[tasks.variants]]
        params = { stage = "1-7", series = 6 }


        #------------------------------ Mall ------------------------------#
        [[tasks]]
        type = "Mall"

        [tasks.params]
        shopping = false

        [[tasks.variants]]
        condition = { type = "Time", start = "18:00:00", end = "21:00:00" }
        params = { credit_fight = true, select_formation = 4 }


        #----------------------------- Recruit ----------------------------#
        [[tasks]]
        type = "Recruit"

        [tasks.params]
        refresh = true
        times = 4
        select = [4, 5]
        confirm = [3, 4, 5]
        skip_robot = false
        recruitment_time = { '3' = 460 }


        #------------------------------ Award -----------------------------#
        [[tasks]]
        type = "Award"

        [tasks.params]
        award = true
        mail = true
        orundum = true
        specialaccess = true


        #--------------------------- Close Game ---------------------------#
        [[tasks]]
        type = "CloseDown"
      '';

      ".config/maa/profiles/default.toml".text = ''
        [connection]
        preset = "PlayCover"

        [resource]
        global_resource = "YoStarEN"
        platform_diff_resource = "iOS"
        user_resource = true

        [static_options]
        cpu_ocr = false
        gpu_ocr = 1

        [instance_options]
        touch_mode = "MacPlayTools"
        deployment_with_pause = false
        adb_lite_enabled = false
        kill_adb_on_exit = false
      '';
    };
  } // lib.optionalAttrs (platform == "linux") {
    persistence."/persistent/home/w".directories = [
      ".local/share/maa"
    ];
  });
}