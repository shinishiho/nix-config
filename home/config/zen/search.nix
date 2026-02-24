{
  pkgs,
  ...
}:

{
  programs.zen-browser.profiles."Default (release)".search = {
    force = true;
    default = "ddg";
    engines = {
      "NixOS Packages" = {
        name = "NixOS Packages";
        urls = [ { template = "https://search.nixos.org/packages?query={searchTerms}"; } ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@np" ];
      };
      "NixOS Options" = {
        name = "NixOS Options";
        urls = [ { template = "https://search.nixos.org/options?query={searchTerms}"; } ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@no" ];
      };
      "Home Manager Options" = {
        name = "Home Manager Options";
        urls = [ { template = "https://home-manager-options.extranix.com/?query={searchTerms}"; } ];
        icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
        definedAliases = [ "@hm" ];
      };
      "Jisho" = {
        name = "Jisho";
        urls = [ { template = "https://jisho.org/search/{searchTerms}"; } ];
        definedAliases = [ "@jisho" ];
      };
    };
  };
}
