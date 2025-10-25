{
  config,
  lib,
  inputs,
  ...
}:

with lib;

let
  cfg = config.my-apps;
in
{
  imports = [
    inputs.impermanence.homeManagerModules.impermanence
  ];

  home.persistence."/persistent/home/${config.home.username}" = {
    directories = []
    # Browsers
    ++ optionals (cfg.browsers.chromium.enable) [ ".config/chromium" ]
    ++ optionals (cfg.browsers.firefox.enable) [ ".mozilla" ]
    ++ optionals (cfg.browsers.zen.enable) [ ".zen" ]

    # Communication
    ++ optionals (cfg.communication.thunderbird.enable) [ ".thunderbird" ]
    ++ [ ".config/Signal" ]

    # Editors
    ++ optionals (cfg.editors.cursor.enable) [ ".cursor" ".config/Cursor" ]
    ++ optionals (cfg.editors.vscode.enable) [ ".config/Code/User" ".vscode" ]
    ++ optionals (cfg.editors.zeditor.enable) [ ".local/share/zed" ]

    # Gaming
    ++ optionals (cfg.gaming.streaming.enable) [ ".config/Moonlight Game Streaming Project" ".parsec" ]
    ++ optionals (cfg.gaming.maa.enable) [ ".local/share/maa" ]
    ++ optionals (cfg.gaming.osu.enable) [ ".local/share/osu/files" ]

    # Media
    ++ optionals (cfg.media.obs.enable) [ ".config/obs-studio" ]

    # Utilities
    ++ optionals (config.programs.zoxide.enable) [ ".local/share/zoxide" ]
    ++ optionals (config.programs.fish.enable) [ ".local/share/fish" ]
    ++ optionals (config.programs.nixvim.enable) [ ".vim/undodir" ]
    ++ optionals (config.programs.direnv.enable) [ ".local/share/direnv" ]
    ++ optionals (config.programs.ssh.enable) [ ".ssh" ]
    ++ optionals (config.programs.gpg.enable) [ ".gnupg" ];
  };
}
