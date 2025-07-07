{
  inputs,
  pkgs,
  ...
}:

let
  vietDict = ./viet.py;
in
{
  imports = [
    inputs.plover-flake.homeManagerModules.plover
  ];

  programs.plover = {
    enable = true;
    package = inputs.plover-flake.packages.${pkgs.system}.plover.withPlugins (
      ps: with ps; [
        plover-lapwing-aio
      ]
    );

    settings = {
      "Gemini PR" = {};
      
      "Logging Configuration" = {
        log_file = "strokes.log";
      };
      
      "Machine Configuration" = {
        machine_type = "Keyboard";
      };
      
      "Output Configuration" = {
        undo_levels = 100;
      };
      
      "Plugins" = {};
      
      "Startup" = {
        "start minimized" = true;
      };
      
      "System" = {
        name = "Lapwing";
      };
      
      "System: Lapwing" = {
        dictionaries = [
          {enabled = true; path = "${vietDict}";}
          # {enabled = true; path = "user.json";}
          {enabled = true; path = "jeff-phrasing.py";}
          {enabled = true; path = "abby-left-hand-modifiers.py";}
          {enabled = true; path = "emily-modifiers.py";}
          {enabled = true; path = "emily-symbols.py";}
          {enabled = true; path = "lapwing-movement.modal";}
          {enabled = true; path = "lapwing-commands.json";}
          {enabled = true; path = "lapwing-numbers.json";}
          {enabled = true; path = "lapwing-uk-additions.json";}
          {enabled = true; path = "lapwing-proper-nouns.json";}
          {enabled = true; path = "lapwing-base.json";}
        ];
      };
      
      "Translation Frame" = {
        opacity = 100;
      };
    };
  };
}