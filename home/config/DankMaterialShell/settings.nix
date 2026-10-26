{
  appIdSubstitutions = [ ];
  barConfigs = [
    {
      autoHide = false;
      autoHideDelay = 250;
      borderColor = "surfaceText";
      borderEnabled = false;
      borderOpacity = 1;
      borderThickness = 1;
      bottomGap = 0;
      centerWidgets = [
        {
          audioScrollMode = "volume";
          enabled = true;
          id = "music";
          mediaSize = 1;
        }
        {
          enabled = true;
          id = "dankPomodoroTimer";
        }
        {
          clockCompactMode = false;
          enabled = true;
          id = "clock";
        }
        {
          enabled = true;
          id = "weather";
        }
      ];
      clickThrough = true;
      enabled = true;
      followInterfaceStyle = true;
      fontScale = 1;
      gothCornerRadiusOverride = false;
      gothCornerRadiusValue = 12;
      gothCornersEnabled = false;
      id = "default";
      innerPadding = 4;
      leftWidgets = [
        {
          dwlShowAllTags = false;
          enabled = true;
          groupWorkspaceApps = true;
          id = "workspaceSwitcher";
          maxWorkspaceIcons = 3;
          reverseScrolling = false;
          showOccupiedWorkspacesOnly = true;
          showWorkspaceApps = true;
          showWorkspaceIndex = false;
          showWorkspaceName = true;
          showWorkspacePadding = false;
          workspaceAppIconSizeOffset = 0;
          workspaceColorMode = "default";
          workspaceDragReorder = true;
          workspaceFocusedBorderColor = "primary";
          workspaceFocusedBorderEnabled = false;
          workspaceFocusedBorderThickness = 2;
          workspaceFollowFocus = false;
          workspaceOccupiedColorMode = "none";
          workspaceUnfocusedColorMode = "default";
          workspaceUrgentColorMode = "default";
        }
        {
          enabled = true;
          id = "cpuUsage";
          minimumWidth = true;
        }
        {
          enabled = true;
          id = "cpuTemp";
          minimumWidth = true;
        }
        {
          enabled = true;
          id = "memUsage";
          minimumWidth = true;
        }
        {
          enabled = true;
          id = "network_speed_monitor";
        }
        {
          enabled = true;
          id = "powerUsagePlugin";
        }
      ];
      maximizeDetection = true;
      name = "Main Bar";
      noBackground = false;
      openOnOverview = false;
      popupGapsAuto = true;
      popupGapsManual = 4;
      position = 0;
      rightWidgets = [
        {
          enabled = true;
          id = "systemTray";
        }
        {
          enabled = true;
          id = "notificationButton";
        }
        {
          enabled = true;
          id = "battery";
        }
        {
          enabled = true;
          id = "clipboard";
        }
        {
          enabled = true;
          id = "homeAssistantMonitor";
        }
        {
          enabled = true;
          id = "systemUpdate";
        }
        {
          enabled = true;
          id = "dankActions:variant_1771580197754";
        }
        {
          enabled = true;
          id = "controlCenterButton";
          showAudioIcon = true;
          showAudioPercent = false;
          showBatteryIcon = false;
          showBluetoothIcon = true;
          showBrightnessIcon = false;
          showBrightnessPercent = false;
          showMicIcon = false;
          showMicPercent = true;
          showNetworkIcon = true;
          showPrinterIcon = false;
          showScreenSharingIcon = true;
          showVpnIcon = true;
        }
      ];
      screenPreferences = [ "all" ];
      scrollEnabled = true;
      scrollXBehavior = "focusWindow";
      scrollYBehavior = "workspace";
      shadowColorMode = "text";
      shadowCustomColor = "#000000";
      shadowIntensity = 0;
      shadowOpacity = 60;
      showOnLastDisplay = true;
      showOnWindowsOpen = false;
      spacing = 4;
      squareCorners = false;
      transparency = 1;
      visible = true;
      widgetFollowInterfaceStyle = true;
      widgetOutlineColor = "primary";
      widgetOutlineEnabled = false;
      widgetOutlineOpacity = 1;
      widgetOutlineThickness = 1;
      widgetTransparency = 1;
    }
  ];
  barElevationEnabled = false;
  builtInPluginSettings = {
    dms_settings_search = {
      trigger = "!";
    };
  };
  clipboardEnterToPaste = true;
  clockFormat = "24h";
  configVersion = 42;
  controlCenterWidgets = [
    {
      enabled = true;
      h = 1;
      id = "user";
      w = 5;
    }
    {
      enabled = true;
      h = 1;
      id = "settings";
      small = true;
      w = 1;
    }
    {
      enabled = true;
      h = 1;
      id = "lock";
      small = true;
      w = 1;
    }
    {
      enabled = true;
      h = 1;
      id = "power";
      small = true;
      w = 1;
    }
    {
      enabled = true;
      h = 1;
      id = "volumeSlider";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "brightnessSlider";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "wifi";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "bluetooth";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "audioOutput";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "audioInput";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "nightMode";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "darkMode";
      w = 4;
    }
    {
      enabled = true;
      h = 1;
      id = "edit";
      small = true;
      w = 1;
    }
    {
      col = 0;
      enabled = true;
      h = 1;
      id = "runningApps";
      row = 6;
      small = true;
      w = 4;
    }
  ];
  currentThemeCategory = "dynamic";
  currentThemeName = "dynamic";
  cursorSettings = {
    dwl = {
      cursorHideTimeout = 0;
    };
    hyprland = {
      hideOnKeyPress = false;
      hideOnTouch = false;
      inactiveTimeout = 0;
    };
    niri = {
      hideAfterInactiveMs = 0;
      hideWhenTyping = true;
    };
    size = 24;
    theme = "System Default";
  };
  dockConfigs = [
    {
      autoHide = false;
      borderColor = "surfaceText";
      borderEnabled = false;
      borderOpacity = 1;
      borderThickness = 1;
      bottomGap = 0;
      editOnRightClick = false;
      enabled = false;
      followInterfaceStyle = true;
      groupByApp = false;
      iconSize = 40;
      id = "dock";
      indicatorStyle = "circle";
      isolateDisplays = false;
      itemSpacing = 4;
      launcherEnabled = false;
      launcherLogoBrightness = 0.5;
      launcherLogoColorOverride = "";
      launcherLogoContrast = 1;
      launcherLogoCustomPath = "";
      launcherLogoMode = "apps";
      launcherLogoSizeOffset = 0;
      magnification = false;
      magnificationExpand = false;
      magnificationProfile = "parabolic";
      magnificationScale = 130;
      margin = 0;
      maxVisibleApps = 0;
      maxVisibleRunningApps = 0;
      mode = "compact";
      name = "Dock";
      openOnOverview = false;
      order = [ ];
      position = 1;
      restoreSpecialWorkspaceOnClick = false;
      screenPreferences = [ "all" ];
      separatePinnedAndRunningApps = false;
      showOnFullscreen = false;
      showOnLastDisplay = true;
      showOverflowBadge = true;
      showTrash = false;
      smartAutoHide = false;
      spacing = 4;
      taskbarAlign = "center";
      transparency = 1;
      trashCustomCommand = "";
      trashFileManager = "default";
      useOverlayLayer = false;
      widgetExpansion = "popout";
      widgets = [
        {
          enabled = true;
          id = "dock_launcher";
          widgetId = "dockLauncher";
        }
        {
          enabled = true;
          id = "dock_apps";
          widgetId = "appsDock";
        }
        {
          enabled = true;
          id = "dock_trash";
          widgetId = "dockTrash";
        }
      ];
    }
  ];
  fontFamily = "Inter Variable";
  lockScreenPowerOffMonitorsOnLock = true;
  lockScreenShowPowerActions = true;
  lockScreenWidgetInstances = [
    {
      config = {
        autoPosition = true;
        colorMode = "default";
        customColor = "#ffffff";
        displayPreferences = [ "all" ];
        showAnalogNumbers = false;
        showAnalogSeconds = true;
        showDate = false;
        showDigitalSeconds = false;
        style = "expressive";
        syncPositionAcrossScreens = true;
        transparency = 0;
        twoTone = true;
        weight = 0;
      };
      enabled = true;
      id = "lock_clock";
      widgetType = "desktopClock";
    }
    {
      config = {
        colorMode = "default";
        customColor = "#ffffff";
        displayPreferences = [ "all" ];
        format = "short";
        syncPositionAcrossScreens = true;
      };
      enabled = true;
      id = "lock_date";
      widgetType = "lockDate";
    }
    {
      config = {
        displayPreferences = [ "all" ];
        passwordVisibility = "always";
        profileVisibility = "always";
        style = "expressive";
        syncPositionAcrossScreens = true;
      };
      enabled = true;
      id = "lock_auth";
      widgetType = "lockAuth";
    }
    {
      config = {
        displayPreferences = [ "all" ];
        mode = 2;
        syncPositionAcrossScreens = true;
      };
      enabled = false;
      id = "lock_notifications";
      widgetType = "lockNotifications";
    }
    {
      config = {
        background = false;
        displayPreferences = [ "all" ];
        showMediaPlayer = true;
        showWeather = true;
        syncPositionAcrossScreens = true;
      };
      enabled = true;
      id = "lock_status";
      widgetType = "lockStatus";
    }
    {
      config = {
        displayPreferences = [ "all" ];
        shape = "round";
        syncPositionAcrossScreens = true;
      };
      enabled = true;
      id = "lock_power";
      widgetType = "lockPower";
    }
  ];
  matugenTemplateNeovim = true;
  osdAlwaysShowValue = true;
  osdMediaPlaybackEnabled = true;
  osdPowerProfileEnabled = true;
  radiusStrength = 38;
  widgetBackgroundColor = "sch";
  widgetColorMode = "colorful";
}
