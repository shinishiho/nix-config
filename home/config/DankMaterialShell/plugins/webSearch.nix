{
  programs.dank-material-shell.plugins = {
    webSearch = {
      enable = true;
      settings = {
        trigger = "?";
        searchEngines = [
          {
            id = "home-manager";
            name = "Home Manager Option Search";
            icon = "material:ac_unit";
            url = "https://home-manager-options.extranix.com/?query=%s&release=master";
            keywords = [
              "hm"
            ];
          }
        ];
        disabledEngines = [
          "amazon"
          "ebay"
          "images"
          "twitter"
          "imdb"
        ];
        defaultEngine = "duckduckgo";
      };
    };
  };
}
