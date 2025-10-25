{
  pkgs,
  ...
}:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    grammarPackages = with pkgs.vimPlugins.nvim-treesitter.builtGrammars; [
      bash
      cpp
      css
      html
      javascript
      json
      lua
      make
      markdown
      markdown_inline
      nix
      python
      regex
      toml
      typescript
      vim
      vimdoc
      xml
      yaml
    ];

    settings = {
      highlight.enable = true;
      indent.enable = true;
    };
  };
}
