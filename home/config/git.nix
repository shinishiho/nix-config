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
        };

        commit.template = "~/.gitmessage";

        commit.gpgsign = true;
        gpg.program = "gpg2";
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

  home.file.".gitmessage".text = ''
# <type>[optional scope]: <description>
# |<----  Max 50 chars (subject line)  ---->|
#
# feat:     new feature (MINOR in semver)
# fix:      bug fix (PATCH in semver)
# docs:     documentation only
# style:    formatting, missing semicolons, etc (no logic change)
# refactor: code change that is neither fix nor feature
# perf:     performance improvement
# test:     adding or updating tests
# build:    build system or dependency changes
# ci:       CI configuration changes
# chore:    other changes that don't modify src or test files
# revert:   reverts a previous commit
#
# BREAKING CHANGE: append ! after type/scope, e.g. feat!: or feat(api)!:
# This triggers a MAJOR version bump in semver.

# [optional body]
# |<----  Wrap at 72 chars  (body)  ---------------------------------------->|
#
# Explain *what* and *why*, not *how*.
# Separate from subject with a blank line.

# [optional footer(s)]
# |<----  Wrap at 72 chars  (footer) ---------------------------------------->|
#
# BREAKING CHANGE: <description>
# Fixes #<issue>
# Refs #<issue>
# Co-authored-by: Name <email>
  '';
}
