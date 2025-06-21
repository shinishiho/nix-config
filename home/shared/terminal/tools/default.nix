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
  };

  home.packages = with pkgs; [
    duf
  ];
}
