{
  pkgs,
  ...
}:
{
  imports = [
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    ./yazi.nix
  ];

  programs = {
    bun = {
      enable = true;
    };

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

    nix-index-database.comma.enable = true;
    nix-index.enable = true;
    nh.enable = true;

    jq = {
      enable = true;
    };

    eza = {
      enable = true;
      git = true;
      icons = "auto";
    };

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };

    # btop.enable = true;
  };

  home.packages = with pkgs; [
    duf
  ];
}
