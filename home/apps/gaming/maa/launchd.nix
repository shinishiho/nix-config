{
  pkgs,
  ...
}:

{
  launchd.user.agents.maa-rock = {
    enable = true;
    config = {
      ProgramArguments = [
        "${pkgs.maa-cli}/bin/maa"
        "run"
        "rock"
      ];
      StartCalendarInterval = [
        { Hour = 2; Minute = 0; }
        { Hour = 10; Minute = 0; }
        { Hour = 18; Minute = 0; }
      ];
      StandardOutPath = "/tmp/maa-rock.log";
      StandardErrorPath = "/tmp/maa-rock.err";
    };
  };
}
