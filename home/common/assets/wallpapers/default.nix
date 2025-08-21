let
  wallpapers = {
    dark = ./w_dark.jpg;
    light = ./w_light.jpg;
    angelina = ./angelina.jpg;
    beans = ./beans.png;
    burning_cherry = ./burning_cherry.jpeg;
    cat_lofi_cafe = ./cat_lofi_cafe.jpg;
    chainsaw_makima = ./chainsaw_makima.png;
    flying_out = ./flying_out.png;
    jormungandr = ./jormungandr.jpg;
    lowpoly_street = ./lowpoly_street.png;
    reindeer_forest = ./reindeer_forest.jpg;
    tokyo_pink = ./tokyo_pink.png;
    waifu_angel = ./waifu_angel.jpg;
    waifu_pink = ./waifu_pink.png;
    shinshi = ./shinshi.jpg;
    shinshi_2 = ./shinshi_2.jpg;
  };
in
{
  _module.args.wallpapers = wallpapers;
}
