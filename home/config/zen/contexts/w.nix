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
    "Claude" = {
      id = "9da65306-7170-465e-b44a-4ba097113beb";
      container = container.id;
      workspace = space.id;
      url = "https://claude.ai/";
      isEssential = true;
      position = 102;
    };
    "ChatGPT" = {
      id = "7d68c54d-1e5f-4e45-82a1-35723429d83c";
      container = container.id;
      workspace = space.id;
      url = "https://chatgpt.com/";
      isEssential = true;
      position = 103;
    };
    "Tuta" = {
      id = "d77e3935-7ff7-483e-a8b9-5e8992dd2fac";
      container = container.id;
      workspace = space.id;
      url = "https://app.tuta.com/";
      isEssential = true;
      position = 104;
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
