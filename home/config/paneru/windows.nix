{ ... }:

{
  # Floating app rules migrated from aerospace on-window-detected "layout floating".
  # Paneru window rules can't assign a workspace at spawn (it uses session restore
  # instead), so only the floating behavior carries over here.
  services.paneru.settings.windows = {
    arknights = {
      title = ".*";
      bundle_id = "com.YoStarEN.Arknights";
      floating = true;
    };
    endfield = {
      title = ".*";
      bundle_id = "com.gryphline.endfield.ios";
      floating = true;
    };
    systemsettings = {
      title = ".*";
      bundle_id = "com.apple.systempreferences";
      floating = true;
    };
    securityagent = {
      title = ".*";
      bundle_id = "com.apple.SecurityAgent";
      floating = true;
    };
  };
}
