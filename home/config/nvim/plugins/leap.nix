{
  programs.nixvim = {
    plugins.leap = {
      enable = true;
    };

    keymaps = [
      {
        mode = [
          "n"
          "x"
          "v"
        ];
        key = "s";
        action = "<Plug>(leap)";
      }
    ];
  };
}
