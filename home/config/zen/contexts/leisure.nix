{ ... }:

let
  container = {
    color = "blue";
    icon = "chill";
    id = 4;
  };

  space = {
    id = "{a1c1c97d-8c01-46a8-9761-8666d753bebd}";
    icon = "🎵";
    container = container.id;
    position = 3000;
    theme = {
      type = "gradient";
      colors = [
        {
          red = 75;
          green = 231;
          blue = 210;
          algorithm = "floating";
          type = "explicit-lightness";
          lightness = 60;
          position = {
            x = 147;
            y = 195;
          };
        }
      ];
      opacity = 0.3;
    };
  };

  pins = {
    "YouTube" = {
      id = "aee9b355-3e29-41d6-9264-443e1295c30b";
      container = container.id;
      workspace = space.id;
      url = "https://www.youtube.com/";
      isEssential = true;
      position = 301;
    };
    "Facebook" = {
      id = "93d7323e-4257-4490-a500-48b14984388e";
      container = container.id;
      workspace = space.id;
      url = "https://www.facebook.com/";
      isEssential = true;
      position = 302;
    };
  };
in

{
  programs.zen-browser.profiles.default = {
    containers.Relax = container;
    spaces.Leisure = space;
    inherit pins;
  };
}
