{
  programs.nixvim.plugins = {
    luasnip = {
      enable = true;
      settings = {
        enable_autosnippets = true;
      };

      filetypeExtend = {
        typescript = [ "tsdoc" ];
        javascript = [ "jsdoc" ];
        lua = [ "luadoc" ];
        python = [ "pydoc" ];
        rust = [ "rustdoc" ];
        cs = [ "csharpdoc" ];
        java = [ "javadoc" ];
        c = [ "cdoc" ];
        cpp = [ "cppdoc" ];
        php = [ "phpdoc" ];
        kotlin = [ "kdoc" ];
        ruby = [ "rdoc" ];
        sh = [ "shelldoc" ];
      };

      fromVscode = [ { } ];
      fromSnipmate = [ { } ];
    };

    friendly-snippets.enable = true;
  };
}
