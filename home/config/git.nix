{
  programs = {
    git = {
      enable = true;
      
      settings = {
        user = {
          email = "59284549+shinishiho@users.noreply.github.com";
          name = "ShiniShiho";
          signingkey = "4B6D513C8F5D34C4";
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

          init.defaultBranch = "main";
          pull.rebase = false;
          push.autoSetupRemote = true;

          diff = {
            algorithm = "patience";
            compactionHeuristic = true;
          };

          commit.gpgsign = true;
          gpg.program = "gpg2";
        };
      };
      
      lfs.enable = true;
      
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

    delta = {
      enable = true;
      enableGitIntegration = true;
      options = {
        navigate = true;
        light = false;
        side-by-side = true;
        line-numbers = true;
      };
    };
  };
}
