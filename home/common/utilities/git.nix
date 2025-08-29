{
  pkgs,
  ...
}:

{
  programs = {
    git = {
      enable = true;
      
      userEmail = "59284549+shinishiho@users.noreply.github.com";
      userName = "ShiniShiho";
      
      lfs.enable = true;
      
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
        push.autoSetupRemote = true;
        
        diff = {
          algorithm = "patience";
          compactionHeuristic = true;
        };

        url = {
          "git@github.com:".insteadOf = "https://github.com/";
        };
        
        # Signing commits (optional)
        # commit.gpgsign = true;
        # gpg.program = "gpg2";
      };
      
      aliases = {
        st = "status";
        co = "checkout";
        br = "branch";
        ci = "commit";
        ca = "commit -a";
        ps = "push";
        pl = "pull";
        lg = "log --oneline --graph --decorate --all";
        last = "log -1 HEAD";
        unstage = "reset HEAD --";
        visual = "!gitk";
      };
      
      ignores = [
        # macOS
        ".DS_Store"
        "._*"
        
        # Linux
        "*~"
        ".fuse_hidden*"
        ".Trash-*"
        
        # Editors
        ".vscode/"
        "*.swp"
        "*.swo"
        "*~"
        
        # Common build artifacts
        "node_modules/"
        "dist/"
        "build/"
        ".env"
        ".env.local"
      ];
    };

    gh = {
      enable = true;
      extensions = with pkgs; [
        gh-copilot
        gh-markdown-preview
      ];
    };

    gh-dash = {
      enable = true;
    };

    git.delta = {
      enable = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
        line-numbers = true;
      };
    };

    lazygit = {
      enable = true;
    };
  };
}
