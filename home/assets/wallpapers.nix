{
  lib,
  pkgs,
  ...
}:
let
  wallpapers = {
    dark = ./wallpapers/w_dark.jpg;
    light = ./wallpapers/w_light.jpg;
    angelina = ./wallpapers/angelina.jpg;
    beans = ./wallpapers/beans.png;
    burning_cherry = ./wallpapers/burning_cherry.jpeg;
    cat_lofi_cafe = ./wallpapers/cat_lofi_cafe.jpg;
    chainsaw_makima = ./wallpapers/chainsaw_makima.png;
    flying_out = ./wallpapers/flying_out.png;
    jormungandr = ./wallpapers/jormungandr.jpg;
    lowpoly_street = ./wallpapers/lowpoly_street.png;
    reindeer_forest = ./wallpapers/reindeer_forest.jpg;
    tokyo_pink = ./wallpapers/tokyo_pink.png;
    waifu_angel = ./wallpapers/waifu_angel.jpg;
    waifu_pink = ./wallpapers/waifu_pink.png;
  };
in
{
  # Make wallpapers available to other modules
  _module.args.wallpapers = wallpapers;
}
