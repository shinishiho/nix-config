{
  config,
  lib,
  pkgs,
  ...
}:

with lib;

let
  cfg = config.my-apps.browsers.firefox;
in
{
  options.my-apps.browsers.firefox = {
    enable = mkEnableOption "Firefox";
  };

  config = mkIf cfg.enable {
    programs.firefox = {
      enable = true;
      profiles."IAmW" = {
        bookmarks = {
          force = true;
          settings = [
            {
              name = "Study";
              toolbar = true;
              bookmarks = [
                {
                  name = "SIS";
                  url = "https://sis.vgu.edu.vn";
                }
                {
                  name = "e-Learning";
                  url = "https://elearning.vgu.edu.vn";
                }
                {
                  name = "Moodle";
                  url = "https://moodle.vgu.edu.vn";
                }
                {
                  name = "Google Classrooom";
                  url = "https://classroom.google.com";
                }
              ];
            }
          ];
        };

        containers = {
          "Home" = {
            id = 0;
            color = "green";
            icon = "tree";
          };
          "School" = {
            id = 1;
            color = "blue";
            icon = "briefcase";
          };
        };
        containersForce = true;

        extensions.packages = with pkgs.nur.repos.rycee.firefox-addons; [
          adaptive-tab-bar-colour
          aria2-integration
          bitwarden
          chatgptbox
          darkreader
          duckduckgo-privacy-essentials
          multi-account-containers
          privacy-redirect
          foxyproxy-standard
          ublock-origin
        ];

        settings = {
          "extensions.autoDisableScopes" = 0;
          "extensions.activeThemeID" = "firefox-compact-dark@mozilla.org";
          "browser.aboutwelcome.enabled" = false;
          "trailhead.firstrun.didSeeAboutWelcome" = true;
          "datareporting.policy.firstRunURL" = "";
        };

        search = {
          engines = {
            "Nix Packages" = {
              urls = [
                {
                  template = "https://search.nixos.org/packages";
                  params = [
                    {
                      name = "type";
                      value = "packages";
                    }
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@np" ];
            };

            "NixOS Wiki" = {
              urls = [ { template = "https://wiki.nixos.org/index.php?search={searchTerms}"; } ];
              iconUpdateURL = "https://wiki.nixos.org/favicon.png";
              updateInterval = 24 * 60 * 60 * 1000; # every day
              definedAliases = [ "@nw" ];
            };

            "Home Manager Options" = {
              urls = [
                {
                  template = "https://home-manager-options.extranix.com";
                  params = [
                    {
                      name = "query";
                      value = "{searchTerms}";
                    }
                    {
                      name = "release";
                      value = "master";
                    }
                  ];
                }
              ];

              icon = "${pkgs.nixos-icons}/share/icons/hicolor/scalable/apps/nix-snowflake.svg";
              definedAliases = [ "@hm" ];
            };
          };
          default = "DuckDuckGo";
          privateDefault = "DuckDuckGo";
          force = true;
        };
      };
    };
  };
}
