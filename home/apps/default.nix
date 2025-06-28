# Application modules with options-based configuration
{
  lib,
  platform ? "linux",
  ...
}:

with lib;

{
  imports = [
    ./editors
    ./browsers
    ./media
    ./gaming
    ./communication
  ];

  options.my-apps = {
    editors = {
      zeditor = {
        enable = mkEnableOption "Zed Editor";
      };
      cursor = {
        enable = mkEnableOption "Cursor Editor";
      };
      vscode = {
        enable = mkEnableOption "Visual Studio Code";
      };
      nvim = {
        enable = mkEnableOption "Neovim";
      };
    };

    browsers = {
      chromium = {
        enable = mkEnableOption "Ungoogled Chromium";
      };
      firefox = {
        enable = mkEnableOption "Firefox";
      };
    };

    media = {
      mpv = {
        enable = mkEnableOption "MPV Media Player";
      };
      obs = {
        enable = mkEnableOption "OBS Studio";
      };
    };

    gaming = {
      parsec = {
        enable = mkEnableOption "Parsec Game Streaming";
      };
      maa = {
        enable = mkEnableOption "MaaAssistantArknights";
      };
    };

    communication = {
      thunderbird = {
        enable = mkEnableOption "Thunderbird";
      };
    };

    # Pass platform and config to all imported modules
    _module.args = { inherit platform; };
  };
} 