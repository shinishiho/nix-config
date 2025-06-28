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
                  (mkVariant "color")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_40343001790813")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "color"
                      (mkVariant [
                        0.0
                        0.0
                        0.0
                        0.325
                      ])
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
                  (mkVariant "effect_34038989600041")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "radius"
                      (mkVariant 12)
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
                  (mkVariant "color")
                ])
                (mkDictionaryEntry [
                  "id"
                  (mkVariant "effect_21748564481335")
                ])
                (mkDictionaryEntry [
                  "params"
                  (mkVariant [
                    (mkDictionaryEntry [
                      "color"
                      (mkVariant [
                        0.0
                        0.0
                        0.0
                        0.375
                      ])
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
                      (mkVariant 12)
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
}
