{
  programs.zen-browser.policies = {
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
  };
}
