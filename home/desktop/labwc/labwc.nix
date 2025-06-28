{
  pkgs,
  ...
}:
{
  home.file."autostart" = {
    enable = true;
    text = "${pkgs.writeShellScript "start-parsec" ''
      #!/run/current-system/sw/bin/bash
      ${pkgs.parsec-bin}/bin/parsecd &
      REMOTE_PID=$!
      wait $REMOTE_PID
      ${pkgs.labwc}/bin/labwc -e
    ''}";
    target = ".config/labwc/autostart";
  };

  home.file."config" = {
    enable = true;
    text = ''
      <?xml version="1.0"?>
      <labwc_config>
        <keyboard>
          <keybind key="W-k">
            <action name="ToggleKeybinds" />
          </keybind>
        </keyboard>
      </labwc_config>
    '';
    target = ".config/labwc/rc.xml";
  };
}
