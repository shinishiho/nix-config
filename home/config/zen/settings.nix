{ ... }:

{
  programs.zen-browser.profiles.default.settings = {
    # Tab behaviour
    "browser.ctrlTab.sortByRecentlyUsed" = true;

    # Downloads
    "browser.download.useDownloadDir" = false; # Always ask where to save
    "browser.download.panel.shown" = true;
    "browser.download.lastDir" = "/home/w/Downloads";

    # Language
    "browser.translations.neverTranslateLanguages" = "vi";

    # Security
    "dom.security.https_only_mode_ever_enabled" = true;
    "doh-rollout.disable-heuristics" = true;

    # UI
    "general.autoScroll" = true;
    "accessibility.typeaheadfind.flashBar" = 0;

    # New tab / startup
    "browser.tabs.warnOnClose" = false;
    "browser.startup.homepage" = "about:blank";
    "browser.newtabpage.enabled" = false;

    # userChrome.css support
    "toolkit.legacyUserProfileCustomizations.stylesheets" = true;

    # Zen-specific
    "zen.workspaces.force-container-workspace" = true;
    "zen.view.sidebar-expanded" = false;
    "zen.view.use-single-toolbar" = false;
    "zen.view.compact.enable-at-startup" = false;
    "zen.welcome-screen.seen" = true;
  };
}
