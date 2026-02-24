{ ... }:

let
  container = {
    color = "turquoise";
    icon = "fingerprint";
    id = 1;
  };

  space = {
    id = "f716fc40-d5a3-40b4-96ef-954ace951cd9";
    icon = "🏡";
    container = container.id;
    position = 1000;
    theme = {
      type = "gradient";
      colors = [
        {
          red = 107;
          green = 118;
          blue = 148;
          algorithm = "floating";
          type = "explicit-lightness";
          lightness = 50;
          position = {
            x = 81;
            y = 84;
          };
        }
      ];
      opacity = 0.3;
    };
  };

  pins = {
    "GitHub" = {
      id = "59168d99-1de7-443b-9d50-cd71e67a9fb7";
      container = container.id;
      workspace = space.id;
      url = "https://github.com/";
      isEssential = true;
      position = 101;
    };
    "ChatGPT" = {
      id = "7d68c54d-1e5f-4e45-82a1-35723429d83c";
      container = container.id;
      workspace = space.id;
      url = "https://chatgpt.com/";
      isEssential = true;
      position = 102;
    };
  };
in

{
  programs.zen-browser.profiles."Default (release)" = {
    containers.W = container;
    spaces.W = space;
    inherit pins;
  };
}
