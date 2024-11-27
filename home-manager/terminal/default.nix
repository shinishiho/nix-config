{ pkgs, ... }: {
  imports = [
    ./misc
    ./nvim
    ./shell
    ./tools
  ];

  home.packages = with pkgs; [
    ani-cli
    cmatrix
    distrobox
    fastfetch
    fd
    gcc
    gotop
    jq
    mosh
    pipes-rs
    python3
    ripgrep
    trickle
    uv

    (writeShellScriptBin "mountCloud" ''
      ${pkgs.coreutils}/bin/mkdir /home/w/Cloud
      ${pkgs.coreutils}/bin/chmod 600 /etc/davfs2/secrets
      ${pkgs.mount}/bin/mount -t davfs https://nextcloud.iamw.top/remote.php/dav/files/admin /home/w/Cloud -o rw,uid=w
    '')
  ];

  programs = {

    fzf = {
      enable = true;
      tmux.enableShellIntegration = true;
    };

  };
}
