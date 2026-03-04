{
  pkgs,
  inputs,
  lib,
  ...
}:

let
  mpvScripts = with pkgs.mpvScripts; [
    uosc
  ]
    ++ (pkgs.lib.optionals pkgs.stdenv.isLinux [ mpris ]);

  viuPackage = inputs.viu.packages.${pkgs.system}.default.overrideAttrs (old: {
    makeWrapperArgs = [
      "--prefix PATH : ${
        lib.makeBinPath [
          (pkgs.mpv.override { scripts = mpvScripts; })
        ]
      }"
    ];
  });
in
{
  home.packages = [ viuPackage ];

  systemd.user.services.viu = {
    Unit = {
      Description = "Viu Background Worker";
      After = [ "network-online.target" ];
    };

    Service = {
      Type = "simple";
      ExecStart = "${viuPackage}/bin/viu worker --log";
      Restart = "always";
      RestartSec = 30;
    };

    Install = {
      WantedBy = [ "default.target" ];
    };
  };
}
