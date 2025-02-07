{
  imports = [
    # ./aria2.nix
    ./git.nix
    ./gpg.nix
    ./ssh.nix
    # ./yazi.nix
  ];

  programs = {
    bun = {
      enable = true;
    };

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
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
}
