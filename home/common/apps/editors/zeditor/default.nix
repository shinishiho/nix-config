{
  config,
  lib,
  ...
}:

with lib;

let
  cfg = config.my-apps.editors.zeditor;
in
{
  options.my-apps.editors.zeditor = {
    enable = mkEnableOption "Zed Editor";
  };

  imports = [
      ./settings.nix
      ./keymap.nix
  ];

  config = mkIf cfg.enable {
    programs.zed-editor = {
      enable = true;
      extensions = [
        "nix"
        "toml"
        "make"
        "catppuccin"
        "latex"
        "catppuccin-icons"
      ];
    };
  };
}