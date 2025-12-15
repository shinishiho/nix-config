let
  vimZellijNavigatorPath = builtins.fetchurl {
    url = "https://github.com/hiasr/vim-zellij-navigator/releases/download/0.3.0/vim-zellij-navigator.wasm";
    sha256 = "sha256-d+Wi9i98GmmMryV0ST1ddVh+D9h3z7o0xIyvcxwkxY0=";
  };
  vimZellijNavigatorUri = "file:${vimZellijNavigatorPath}";
in
  {
  programs.zellij = {
    enable = true;
    settings = {
      theme = "catppuccin-macchiato";
      show_startup_tips = false;
      pane_frames = false;
      default_layout._args = [ "compact" ];
      keybinds = {
        _props.clear-defaults = true;

        _children = [
          {
            # normal mode bindings
            normal._children = [
              {
                bind = {
                  _args = [ "Ctrl w" ];
                  _children = [
                    { SwitchToMode._args = [ "tmux" ]; }
                  ];
                };
              }
            ];
          }

          {
            # tmux mode bindings
            tmux._children = [
              # Tab Operations
              {
                bind = {
                  _args = [ "c" ];
                  _children = [
                    { NewTab = {}; }
                    { SwitchToMode._args = [ "normal" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "d" ];
                  _children = [
                    { Detach = {}; }
                    { SwitchToMode._args = [ "normal" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "x" ];
                  _children = [
                    { CloseFocus = {}; }
                    { SwitchToMode._args = [ "normal" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "s" ];
                  _children = [
                    { NewPane._args = [ "Down" ]; }
                    { SwitchToMode._args = [ "normal" ]; }
                  ];
                };
              }
              {
                bind = {
                  _args = [ "v" ];
                  _children = [
                    { NewPane._args = [ "Right" ]; }
                    { SwitchToMode._args = [ "normal" ]; }
                  ];
                };
              }
              # Tab Navigation 1..9
              {
                bind = {
                  _args = [ "1" ];
                  _children = [ { GoToTab._args = [ 1 ]; } { SwitchToMode._args = [ "normal" ]; } ];
                };
              }
              {
                bind = {
                  _args = [ "2" ];
                  _children = [ { GoToTab._args = [ 2 ]; } { SwitchToMode._args = [ "normal" ]; } ];
                };
              }
              {
                bind = {
                  _args = [ "3" ];
                  _children = [ { GoToTab._args = [ 3 ]; } { SwitchToMode._args = [ "normal" ]; } ];
                };
              }
              {
                bind = {
                  _args = [ "4" ];
                  _children = [ { GoToTab._args = [ 4 ]; } { SwitchToMode._args = [ "normal" ]; } ];
                };
              }
              {
                bind = {
                  _args = [ "5" ];
                  _children = [ { GoToTab._args = [ 5 ]; } { SwitchToMode._args = [ "normal" ]; } ];
                };
              }
              {
                bind = {
                  _args = [ "6" ];
                  _children = [ { GoToTab._args = [ 6 ]; } { SwitchToMode._args = [ "normal" ]; } ];
                };
              }
              {
                bind = {
                  _args = [ "7" ];
                  _children = [ { GoToTab._args = [ 7 ]; } { SwitchToMode._args = [ "normal" ]; } ];
                };
              }
              {
                bind = {
                  _args = [ "8" ];
                  _children = [ { GoToTab._args = [ 8 ]; } { SwitchToMode._args = [ "normal" ]; } ];
                };
              }
              {
                bind = {
                  _args = [ "9" ];
                  _children = [ { GoToTab._args = [ 9 ]; } { SwitchToMode._args = [ "normal" ]; } ];
                };
              }
            ];
          }

          {
            # shared_except blocks
            shared_except = {
              # shared_except "locked"
              _args = [ "locked" ];
              _children = [
                # Quit
                {
                  bind = {
                    _args = [ "Ctrl q" ];
                    _children = [
                      { Quit = {}; }
                    ];
                  };
                }
                # Focus movement
                {
                  bind = {
                    _args = [ "Ctrl h" ];
                    _children = [
                      {
                        MessagePlugin = {
                          _args = [ vimZellijNavigatorUri ];
                          _children = [ { name._args = [ "move_focus_or_tab" ]; } { payload._args = [ "left" ]; } ];
                        };
                      }
                    ];
                  };
                }
                {
                  bind = {
                    _args = [ "Ctrl j" ];
                    _children = [
                      {
                        MessagePlugin = {
                          _args = [ vimZellijNavigatorUri ];
                          _children = [ { name._args = [ "move_focus" ]; } { payload._args = [ "down" ]; } ];
                        };
                      }
                    ];
                  };
                }
                {
                  bind = {
                    _args = [ "Ctrl k" ];
                    _children = [
                      {
                        MessagePlugin = {
                          _args = [ vimZellijNavigatorUri ];
                          _children = [ { name._args = [ "move_focus" ]; } { payload._args = [ "up" ]; } ];
                        };
                      }
                    ];
                  };
                }
                {
                  bind = {
                    _args = [ "Ctrl l" ];
                    _children = [
                      {
                        MessagePlugin = {
                          _args = [ vimZellijNavigatorUri ];
                          _children = [ { name._args = [ "move_focus_or_tab" ]; } { payload._args = [ "right" ]; } ];
                        };
                      }
                    ];
                  };
                }

                # Resizing
                {
                  bind = {
                    _args = [ "Alt h" ];
                    _children = [
                      {
                        MessagePlugin = {
                          _args = [ vimZellijNavigatorUri ];
                          _children = [ { name._args = [ "resize" ]; } { payload._args = [ "left" ]; } ];
                        };
                      }
                    ];
                  };
                }
                {
                  bind = {
                    _args = [ "Alt j" ];
                    _children = [
                      {
                        MessagePlugin = {
                          _args = [ vimZellijNavigatorUri ];
                          _children = [ { name._args = [ "resize" ]; } { payload._args = [ "down" ]; } ];
                        };
                      }
                    ];
                  };
                }
                {
                  bind = {
                    _args = [ "Alt k" ];
                    _children = [
                      {
                        MessagePlugin = {
                          _args = [ vimZellijNavigatorUri ];
                          _children = [ { name._args = [ "resize" ]; } { payload._args = [ "up" ]; } ];
                        };
                      }
                    ];
                  };
                }
                {
                  bind = {
                    _args = [ "Alt f" ];
                    _children = [ { ToggleFloatingPanes = {}; } ];
                  };
                }
                {
                  bind = {
                    _args = [ "Alt l" ];
                    _children = [
                      {
                        MessagePlugin = {
                          _args = [ vimZellijNavigatorUri ];
                          _children = [ { name._args = [ "resize" ]; } { payload._args = [ "right" ]; } ];
                        };
                      }
                    ];
                  };
                }
              ];
            };
          }

          {
            # shared_except "normal" "locked"
            shared_except = {
              _args = [ "normal" "locked" ];
              _children = [
                {
                  bind = {
                    _args = [ "Enter" "Esc" ];
                    _children = [ { SwitchToMode._args = [ "Normal" ]; } ];
                  };
                }
              ];
            };
          }
        ];
      };
    };
  };
}
