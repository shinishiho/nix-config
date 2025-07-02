{
  pkgs,
  ...
}:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    theme = ./rofi.rasi;
  };

  home.file = {
    ".config/rofi/selector.rasi".text = ''
/**
 * ROFI Layout 
 *
 * HyDE's Global Seletor Style
 * User: The HyDE Project [  HyDE's Global Selector Style  ]
 * Copyright: The HyDE Project
 */

// Config //
configuration {
    modi:                        "drun";
    show-icons:                  true;
    drun-display-format:         "{name}";
    font:                        "JetBrainsMono Nerd Font 10";
}

@theme "~/.config/rofi/theme.rasi"


// Main //
window {
    enabled:                     true;
    fullscreen:                  false;
    transparency:                "real";
    cursor:                      "default";
    spacing:                     0em;
    padding:                     0em;
    border:                      0em;
    border-radius:               0em;
    border-color:                transparent;
    background-color:            @main-bg;
    width:                       100%;
}
mainbox {
    enabled:                     true;
    orientation:                 horizontal;
    children:                    [ "dummy", "frame", "dummy" ];
    background-color:            transparent;
}
frame {
    children:                    [ "listview" ];
    background-color:            transparent;
}


// Lists //
listview {
    enabled:                     true;
    spacing:                     5em;
    padding:                     4em;
    columns:                     3;
    lines:                       1;
    dynamic:                     false;
    fixed-height:                false;
    fixed-columns:               true;
    reverse:                     true;
    cursor:                      "default";
    background-color:            transparent;
    text-color:                  @main-fg;
}
dummy {
    width:                       2em;
    expand:                      false;
    background-color:            transparent;
}


// Elements //
element {
    enabled:                     true;
    spacing:                     0em;
    padding:                     0em;
    cursor:                      pointer;
    background-color:            transparent;
    text-color:                  @main-fg;
    border-radius:               30px;
    orientation:                 vertical;
}
element selected.normal {
    background-color:            @select-bg;
    text-color:                  @select-fg;
}
element-icon {
    cursor:                      inherit;
    size:                        28em;
    background-color:            transparent;
    text-color:                  inherit;
    expand:                      false;
    border-radius:               0em;
}
element-text {
    vertical-align:              0.5;
    horizontal-align:            0.5;
    cursor:                      inherit;
    background-color:            transparent;
    text-color:                  inherit;
    padding:                     1em;
}
  '';
  };
}
