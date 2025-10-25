{
  pkgs,
  ...
}:

{
  programs.gh = {
    enable = true;
    extensions = with pkgs; [
      gh-copilot
      gh-markdown-preview
    ];
  };
}
