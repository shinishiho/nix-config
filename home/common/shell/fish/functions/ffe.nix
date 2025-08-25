{
  pkgs,
  ...
}:

{
  programs.fish.functions = {
    ffe = ''
    function ffe
      set fzf_options '--height=80%' \
                      '--layout=reverse' \
                      '--cycle'

      # executables
      set fd ${pkgs.fd}/bin/fd
      set rg ${pkgs.ripgrep}/bin/rg
      set bat ${pkgs.bat}/bin/bat

      # defaults
      set mode "name"
      set max_depth 5
      set preview_enabled 1
      set initial_query ""

      # parse arguments
      set i 1
      while test $i -le (count $argv)
        set arg $argv[$i]
        switch $arg
          case "--help" "-h"
            echo "ffe - fuzzy file explorer"
            echo ""
            echo "Usage:"
            echo "  ffe [options] [query]"
            echo ""
            echo "Options:"
            echo "  -c, --content        Search file contents with rg instead of names"
            echo "  -d, --depth N        Limit search depth (default: 5)"
            echo "  -n, --no-preview     Disable file preview"
            echo "  -h, --help           Show this help message"
            echo ""
            echo "Examples:"
            echo "  ffe main.rs          # Search filenames"
            echo "  ffe -c init          # Search file contents"
            echo "  ffe -d 10 config     # Search filenames up to depth 10"
            echo "  ffe -n               # Disable preview for speed"
            return 0
          case "--content" "-c"
            set mode "content"
          case "--depth=*"
            set max_depth (string replace -- "--depth=" "" $arg)
          case "-d"
            if test (math $i + 1) -le (count $argv)
              set max_depth $argv[(math $i + 1)]
              set i (math $i + 1)
            end
          case "--no-preview" "-n"
            set preview_enabled 0
          case "*"
            set initial_query $arg
        end
        set i (math $i + 1)
      end

      # add preview if enabled
      if test $preview_enabled -eq 1
        set fzf_options $fzf_options '--preview-window=right:60%' \
                                    "--preview=$bat --color=always {}"
      end

      # add initial query if provided
      if test -n "$initial_query"
        set fzf_options $fzf_options "--query=$initial_query"
      end

      # collect candidates
      set selected_file ""
      if test "$mode" = "name"
        set selected_file ($fd --max-depth $max_depth --type f . 2>/dev/null | fzf $fzf_options)
      else if test "$mode" = "content"
        set selected_file ($rg -irl "$initial_query" . 2>/dev/null | fzf $fzf_options)
      end

      # open result
      if test -n "$selected_file"; and test -f "$selected_file"
        $EDITOR "$selected_file"
      else
        echo "No file selected or search returned no results."
        return 1
      end
    end
    '';
  };
}
