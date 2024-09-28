{ pkgs, ... }: {
  programs.git = {
    enable = true;
    userEmail = "59284549+shinishiho@users.noreply.github.com";
    userName = "w";

    lfs.enable = true;
  };

  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-copilot
      gh-markdown-preview
    ];
  };

  programs.gh-dash = {
    enable = true;
  };
}
