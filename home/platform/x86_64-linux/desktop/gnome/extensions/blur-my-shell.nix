{
  lib,
  pkgs,
  ...
}:
{
  programs.gnome-shell.extensions = [ { package = pkgs.gnomeExtensions.blur-my-shell; } ];

  dconf.settings."org/gnome/shell/extensions/blur-my-shell" = {
    pipelines = with lib.hm.gvariant; [
      (mkDictionaryEntry [
        "pipeline_default"
        [
          (mkDictionaryEntry [
            "name"
            (mkVariant "Default")
          ])
          (mkDictionaryEntry [
            "effects"
            (mkVariant [
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "native_static_gaussian_blur")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_79873243801875")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "unscaled_radius"
                      (mkVariant 12)
                    ])
                    (mkDictionaryEntry [
                      "brightness"
                      (mkVariant 1)
                    ])
                  ])
                ])
              ])
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "noise")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_40457420615871")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "lightness"
                      (mkVariant 1)
                    ])
                  ])
                ])
              ])
            ])
          ])
        ]
      ])
      (mkDictionaryEntry [
        "pipeline_default_rounded"
        [
          (mkDictionaryEntry [
            "name"
            (mkVariant "Default rounded")
          ])
          (mkDictionaryEntry [
            "effects"
            (mkVariant [
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "native_static_gaussian_blur")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_85953694960304")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "unscaled_radius"
                      (mkVariant 5)
                    ])
                    (mkDictionaryEntry [
                      "brightness"
                      (mkVariant 1)
                    ])
                  ])
                ])
              ])
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "corner")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_000000000002")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "radius"
                      (mkVariant 24)
                    ])
                  ])
                ])
              ])
            ])
          ])
        ]
      ])
      (mkDictionaryEntry [
        "pipeline_92558309780583"
        [
          (mkDictionaryEntry [
            "name"
            (mkVariant "dock")
          ])
          (mkDictionaryEntry [
            "effects"
            (mkVariant [
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "native_static_gaussian_blur")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_94020223477417")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "unscaled_radius"
                      (mkVariant 12)
                    ])
                    (mkDictionaryEntry [
                      "brightness"
                      (mkVariant 1)
                    ])
                  ])
                ])
              ])
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "corner")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_73133520048057")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "radius"
                      (mkVariant 26)
                    ])
                    (mkDictionaryEntry [
                      "corners_bottom"
                      (mkVariant true)
                    ])
                  ])
                ])
              ])
            ])
          ])
        ]
      ])
      (mkDictionaryEntry [
        "pipeline_83755828837929"
        [
          (mkDictionaryEntry [
            "name"
            (mkVariant "lock screen")
          ])
          (mkDictionaryEntry [
            "effects"
            (mkVariant [
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "native_static_gaussian_blur")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_03522319914933")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "brightness"
                      (mkVariant 0.8)
                    ])
                  ])
                ])
              ])
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "noise")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_84670467311315")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "lightness"
                      (mkVariant 1)
                    ])
                  ])
                ])
              ])
            ])
          ])
        ]
      ])
      (mkDictionaryEntry [
        "pipeline_41793305616234"
        [
          (mkDictionaryEntry [
            "name"
            (mkVariant "panel")
          ])
          (mkDictionaryEntry [
            "effects"
            (mkVariant [
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "corner")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_22385275388618")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "radius"
                      (mkVariant 50)
                    ])
                  ])
                ])
              ])
              (mkVariant [
                (mkDictionaryEntry [
                  "type"
                  (mkVariant "native_static_gaussian_blur")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_90439598558481")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "unscaled_radius"
                      (mkVariant 12)
                    ])
                    (mkDictionaryEntry [
                      "brightness"
                      (mkVariant 1)
                    ])
                  ])
                ])
              ])
            ])
          ])
        ]
      ])
    ];
  };

  dconf.settings."org/gnome/shell/extensions/blur-my-shell/panel" = {
    brightness = 0.6;
    force-light-text = true;
    pipeline = "pipeline_41793305616234";
    sigma = 30;
  };

  dconf.settings."org/gnome/shell/extensions/blur-my-shell/appfolder" = {
    brightness = 1;
    sigma = 50;
    dialog = 2;
  };

  dconf.settings."org/gnome/shell/extensions/blur-my-shell/overview" = {
    pipeline = "pipeline_83755828837929";
  };

  dconf.settings."org/gnome/shell/extensions/blur-my-shell/dash-to-dock" = {
    blur = true;
    brightness = 1;
    pipeline = "pipeline_default_rounded";
    sigma = 4;
    static-blur = false;
    style-dash-to-dock = 0;
    unblur-in-overview = true;
  };

  dconf.settings."org/gnome/shell/extensions/blur-my-shell/applications" = {
    blacklist = [
      "Plank"
      "com.desktop.ding"
      "Conky"
    ];
    blur = true;
    dynamic-opacity = false;
    enable-all = true;
    opacity = 240;
    sigma = 12;
  };

  dconf.settings."org/gnome/shell/extensions/blur-my-shell/lockscreen" = {
    pipeline = "pipeline_83755828837929";
  };
}
