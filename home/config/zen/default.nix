{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.twilight

    ./contexts
    ./extensions.nix
    ./policies.nix
    ./search.nix
    ./settings.nix
  ];

  programs.zen-browser = {
    enable = true;
    nixGL.enable = true;
  };

  xdg.mimeApps =
    let
      desktopFile =
        inputs.zen-browser.packages.${pkgs.stdenv.hostPlatform.system}.beta.meta.desktopFileName;
      mimeTypes = [
        "application/x-extension-shtml"
        "application/x-extension-xhtml"
        "application/x-extension-html"
        "application/x-extension-xht"
        "application/x-extension-htm"
        "x-scheme-handler/unknown"
        "x-scheme-handler/mailto"
        "x-scheme-handler/chrome"
        "x-scheme-handler/about"
        "x-scheme-handler/https"
        "x-scheme-handler/http"
        "application/xhtml+xml"
        "application/json"
        "text/plain"
        "text/html"
      ];
      associations = builtins.listToAttrs (
        map (name: {
          inherit name;
          value = desktopFile;
        }) mimeTypes
      );
    in
    {
      associations.added = associations // {
        "application/pdf" = [ "zen-twilight.desktop" ];
      };
      defaultApplications = associations;
    };

  home.persistence."/persistent".directories = [
    ".config/zen"
  ];
}
