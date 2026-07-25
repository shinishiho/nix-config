{
  config,
  ...
}:
{
  programs.nixvim.plugins.treesitter = {
    enable = true;
    grammarPackages = with config.programs.nixvim.plugins.treesitter.package.builtGrammars; [
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
    };
  };
}
