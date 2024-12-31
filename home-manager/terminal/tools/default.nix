{
  imports = [
    ./aria2.nix
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    #./yazi.nix
  ];

  programs = {
    eza = {
      enable = true;
      git = true;
      icons = "auto";
    };

    zoxide = {
      enable = true;
      options = [ "--cmd cd" ];
    };

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };
    # btop.enable = true;

  };
}
