{ ... }:

{
  programs.aerospace.settings = {
    config-version = 2;

    # Normalization settings
    enable-normalization-flatten-containers = true;
    enable-normalization-opposite-orientation-for-nested-containers = true;

    # Layout configuration
    accordion-padding = 30;
    default-root-container-layout = "tiles";
    default-root-container-orientation = "auto";

    # Mouse follows focus when focused monitor changes
    on-focused-monitor-changed = ["move-mouse monitor-lazy-center"];

    # You can effectively turn off macOS "Hide application" (cmd-h) feature by toggling this flag
    automatically-unhide-macos-hidden-apps = false;

    # Key mapping preset
    key-mapping.preset = "qwerty";

    # Gaps configuration
    gaps = {
      inner = {
        horizontal = 5;
        vertical = 5;
      };
      outer = {
        left = 0;
        bottom = 0;
        top = 0;
        right = 0;
      };
    };
  };
}
