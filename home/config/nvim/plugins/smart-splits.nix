{ pkgs, ... }:
{
  programs.nixvim = {
    extraPlugins = [
      (pkgs.vimUtils.buildVimPlugin {
        pname = "smart-splits-backend-zellij-lua";
        version = "0-unstable-2026-10-28";
        src = pkgs.fetchFromGitHub {
          owner = "smart-splits-nvim";
          repo = "backend-zellij-lua";
          rev = "4e3e588795efb95548dd2ebeaf385a7823821ceb";
          hash = "sha256-QAKX3jHYd2xHjhs8uf44OB04Q+Gl+wXVZOqS09IcRSk=";
        };
      })
      (pkgs.vimUtils.buildVimPlugin {
        pname = "smart-splits-backend-kitty";
        version = "0-unstable-2026-10-28";
        src = pkgs.fetchFromGitHub {
          owner = "smart-splits-nvim";
          repo = "backend-kitty";
          rev = "f892244d69727b8634dd5c085fb041f4e6cc9ef3";
          hash = "sha256-sV49CezLSlxn2+1uCLvehv37FUdTw5yiO/qhC0CPcGQ=";
        };
      })
    ];

    plugins.smart-splits = {
      enable = true;
      settings = {
        mux = {
          backend.__raw = ''
            function()
              local zellij = require('smart-splits-backend-zellij-lua')
              zellij.setup({ move_cursor = { pane_or_tab = true } })
              return { zellij, require('smart-splits-backend-kitty') }
            end
          '';
          warn_if_unusable = false;
        };
      };
    };

    keymaps = [
      {
        mode = "n";
        key = "<A-h>";
        action.__raw = "require('smart-splits').resize_left";
      }
      {
        mode = "n";
        key = "<A-j>";
        action.__raw = "require('smart-splits').resize_down";
      }
      {
        mode = "n";
        key = "<A-k>";
        action.__raw = "require('smart-splits').resize_up";
      }
      {
        mode = "n";
        key = "<A-l>";
        action.__raw = "require('smart-splits').resize_right";
      }
      {
        mode = "n";
        key = "<C-h>";
        action.__raw = "require('smart-splits').move_cursor_left";
      }
      {
        mode = "n";
        key = "<C-j>";
        action.__raw = "require('smart-splits').move_cursor_down";
      }
      {
        mode = "n";
        key = "<C-k>";
        action.__raw = "require('smart-splits').move_cursor_up";
      }
      {
        mode = "n";
        key = "<C-l>";
        action.__raw = "require('smart-splits').move_cursor_right";
      }
    ];
  };
}
