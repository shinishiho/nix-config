{
  config,
  inputs,
  pkgs,
  ...
}:

{
  imports = [
    inputs.zen-browser.homeModules.twilight
  ];

  programs.zen-browser = {
    enable = true;
    nixGL.enable = true;

    # Common policies for privacy and security
    policies = {
      # Disable automatic updates (managed by Nix)
      DisableAppUpdate = true;

      # Privacy settings
      DisableTelemetry = true;
      DisableFirefoxStudies = true;
      DisablePocket = true;
      DisableFeedbackCommands = true;

      # Security and autofill settings
      AutofillAddressEnabled = false;
      AutofillCreditCardEnabled = false;
      OfferToSaveLogins = false;

      # UI preferences
      DontCheckDefaultBrowser = true;
      NoDefaultBookmarks = true;

      # Enhanced tracking protection
      EnableTrackingProtection = {
        Value = true;
        Locked = true;
        Cryptomining = true;
        Fingerprinting = true;
      };

      # Zen-specific and general preferences
      Preferences = let
        locked = value: {
          "Value" = value;
          "Status" = "locked";
        };
        default = value: {
          "Value" = value;
          "Status" = "default";
        };
      in {
        "browser.tabs.warnOnClose" = locked false;
        "browser.startup.homepage" = default "about:blank";
        "browser.newtabpage.enabled" = locked false;
        # Enable userChrome.css
        "toolkit.legacyUserProfileCustomizations.stylesheets" = default true;
      };
    };
  };

  home.persistence."/persistent".directories = [
    ".zen"
  ];

  xdg.mimeApps.associations.added = {
    "application/pdf" = [ "zen-twilight.desktop" ];
  };
}
