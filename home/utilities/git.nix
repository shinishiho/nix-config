# Git configuration with useful aliases and settings
{
  pkgs,
  ...
}:

{
  programs = {
    git = {
      enable = true;
      
      # User configuration merged from terminal/tools/git.nix
      userEmail = "59284549+shinishiho@users.noreply.github.com";
      userName = "ShiniShiho";
      
      lfs.enable = true;
      
      extraConfig = {
        init.defaultBranch = "main";
        pull.rebase = false;
        push.autoSetupRemote = true;
        
        # Better diff highlighting
        diff = {
          algorithm = "patience";
          compactionHeuristic = true;
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

    # GitHub CLI configuration merged from terminal/tools/git.nix
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
  };
}
