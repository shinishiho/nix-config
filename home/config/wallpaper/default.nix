{
  pkgs,
  lib,
  config,
  ...
}:
let
  wallpaperDir = "Pictures/Wallpapers";

  wallpapers = {
    "w_dark.jpg" = ./w_dark.jpg;
    "w_light.jpg" = ./w_light.jpg;
    "angelina.jpg" = ./angelina.jpg;
    "beans.png" = ./beans.png;
    "burning_cherry.jpeg" = ./burning_cherry.jpeg;
    "cat_lofi_cafe.jpg" = ./cat_lofi_cafe.jpg;
    "chainsaw_makima.png" = ./chainsaw_makima.png;
    "flying_out.png" = ./flying_out.png;
    "jormungandr.jpg" = ./jormungandr.jpg;
    "lowpoly_street.png" = ./lowpoly_street.png;
    "reindeer_forest.jpg" = ./reindeer_forest.jpg;
    "tokyo_pink.png" = ./tokyo_pink.png;
    "waifu_angel.jpg" = ./waifu_angel.jpg;
    "waifu_pink.png" = ./waifu_pink.png;
    "shinshi.jpg" = ./shinshi.jpg;
    "shinshi_2.jpg" = ./shinshi_2.jpg;
    "lilith_bed.png" = ./lilith_bed.png;
    "lilith_demon_king.png" = ./lilith_demon_king.png;
    "lilith_ferris.png" = ./lilith_ferris.png;
    "lilith_hug.png" = ./lilith_hug.png;
    "lilith_lie.png" = ./lilith_lie.png;
    "lilith_nurse.png" = ./lilith_nurse.png;
    "lilith_room.png" = ./lilith_room.png;
    "lilith_sad.png" = ./lilith_sad.png;
    "lilith_sofa.png" = ./lilith_sofa.png;
    "lilith_wonderland.png" = ./lilith_wonderland.png;
  };

  wallpaperPaths = lib.mapAttrsToList (
    name: _: "${config.home.homeDirectory}/${wallpaperDir}/${name}"
  ) wallpapers;
in
{
  home.file = lib.mapAttrs' (
    name: source: lib.nameValuePair "${wallpaperDir}/${name}" { inherit source; }
  ) wallpapers;
}
