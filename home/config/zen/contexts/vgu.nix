{ ... }:

let
  container = {
    color = "red";
    icon = "briefcase";
    id = 2;
  };

  space = {
    id = "{0d2b4fbf-af59-40c6-9c23-d27e59628b8a}";
    icon = "📚️";
    container = container.id;
    position = 2000;
    theme = {
      type = "gradient";
      colors = [
        {
          red = 242;
          green = 115;
          blue = 123;
          algorithm = "floating";
          type = "explicit-lightness";
          lightness = 70;
          position = {
            x = 220;
            y = 187;
          };
        }
      ];
      opacity = 0.3;
    };
  };

  pins = {
    "Gmail" = {
      id = "2c6996cc-1d85-4375-8a10-e6306d1be1a7";
      container = container.id;
      workspace = space.id;
      url = "https://mail.google.com/";
      isEssential = true;
      position = 201;
    };
    "Gemini" = {
      id = "8e503a2b-f1a0-46b1-9943-cab5292f7a18";
      container = container.id;
      workspace = space.id;
      url = "https://gemini.google.com/";
      isEssential = true;
      position = 202;
    };
  };
in

{
  programs.zen-browser.profiles.default = {
    containers.VGU = container;
    spaces.VGU = space;
    inherit pins;
  };
}
