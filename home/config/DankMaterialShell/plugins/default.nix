{
  imports = [
    ./dankActions.nix
    # Dropped from dms-plugin-registry (locked 2026-10-03), no `src`. Re-enable when it returns.
    # ./dankBatteryAlerts.nix
    ./dankPomodoroTimer.nix
    ./dmsPass.nix
    ./homeAssistantMonitor.nix
    ./powerUsagePlugin.nix
    ./webSearch.nix
  ];
}
