{
  programs.yazi = {
    enable = true;
    enableZshIntegration = true;

    flavors = {
      catppuccin-mocha = ./yazi/catppuccin-mocha.yazi;
    };

    plugins = {
      relative-motions = ./yazi/relative-motions.yazi;
    };

    keymap = {
      manager = {
        keymap = [
          {
            on = "<Esc>";
            run = "escape";
          }
          {
            on = "<C-[>";
            run = "escape";
          }
          {
            on = "q";
            run = "quit";
          }
          {
            on = "Q";
            run = "quit --no-cwd-file";
          }
          {
            on = "<C-c>";
            run = "close";
          }
          {
            on = "<C-z>";
            run = "suspend";
          }
          {
            on = "k";
            run = "arrow -1";
          }
          {
            on = "j";
            run = "arrow 1";
          }
          {
            on = "<Up>";
            run = "arrow -1";
          }
          {
            on = "<Down>";
            run = "arrow 1";
          }
          {
            on = "<C-u>";
            run = "arrow -50%";
          }
          {
            on = "<C-d>";
            run = "arrow 50%";
          }
          {
            on = "<C-b>";
            run = "arrow -100%";
          }
          {
            on = "<C-f>";
            run = "arrow 100%";
          }
          {
            on = "<S-PageUp>";
            run = "arrow -50%";
          }
          {
            on = "<S-PageDown>";
            run = "arrow 50%";
          }
          {
            on = "<PageUp>";
            run = "arrow -100%";
          }
          {
            on = "<PageDown>";
            run = "arrow 100%";
          }
          {
            on = [ "g" "g" ];
            run = "arrow -99999999";
          }
          {
            on = "G";
            run = "arrow 99999999";
          }
          {
            on = "h";
            run = "leave";
          }
          {
            on = "l";
            run = "enter";
          }
          {
            on = "<Left>";
            run = "leave";
          }
          {
            on = "<Right>";
            run = "enter";
          }
          {
            on = "H";
            run = "back";
          }
          {
            on = "L";
            run = "forward";
          }
          {
            on = "K";
            run = "seek -5";
          }
          {
            on = "J";
            run = "seek 5";
          }
          {
            on = "<Space>";
            run = [ "select --state=none" "arrow 1" ];
          }
          {
            on = "v";
            run = "visual_mode";
          }
          {
            on = "V";
            run = "visual_mode --unset";
          }
          {
            on = "<C-a>";
            run = "select_all --state=true";
          }
          {
            on = "<C-r>";
            run = "select_all --state=none";
          }
          {
            on = "o";
            run = "create";
          }
          {
            on = "O";
            run = "create";
          }
          {
            on = "<Enter>";
            run = "open";
          }
          {
            on = "<S-Enter>";
            run = "open --interactive";
          }
          {
            on = "y";
            run = "yank";
          }
          {
            on = "x";
            run = "yank --cut";
          }
          {
            on = "p";
            run = "paste";
          }
          {
            on = "P";
            run = "paste --force";
          }
          {
            on = "-";
            run = "link";
          }
          {
            on = "_";
            run = "link --relative";
          }
          {
            on = "<C-->";
            run = "hardlink";
          }
          {
            on = "Y";
            run = "unyank";
          }
          {
            on = "X";
            run = "unyank";
          }
          {
            on = "d";
            run = "remove";
          }
          {
            on = "D";
            run = "remove --permanently";
          }
          {
            on = "a";
            run = "create";
          }
          {
            on = "r";
            run = "rename --cursor=before_ext";
          }
          {
            on = ";";
            run = "shell --interactive";
          }
          {
            on = ":";
            run = "shell --block --interactive";
          }
          {
            on = ".";
            run = "hidden toggle";
          }
          {
            on = "s";
            run = "search fd";
          }
          {
            on = "S";
            run = "search rg";
          }
          {
            on = "<C-s>";
            run = "escape --search";
          }
          {
            on = "z";
            run = "plugin zoxide";
          }
          {
            on = "Z";
            run = "plugin fzf";
          }
          {
            on = [ "m" "s" ];
            run = "linemode size";
          }
          {
            on = [ "m" "p" ];
            run = "linemode permissions";
          }
          {
            on = [ "m" "c" ];
            run = "linemode ctime";
          }
          {
            on = [ "m" "m" ];
            run = "linemode mtime";
          }
          {
            on = [ "m" "o" ];
            run = "linemode owner";
          }
          {
            on = [ "m" "n" ];
            run = "linemode none";
          }
          {
            on = [ "c" "c" ];
            run = "copy path";
          }
          {
            on = [ "c" "d" ];
            run = "copy dirname";
          }
          {
            on = [ "c" "f" ];
            run = "copy filename";
          }
          {
            on = [ "c" "n" ];
            run = "copy name_without_ext";
          }
          {
            on = "f";
            run = "filter --smart";
          }
          {
            on = "/";
            run = "find --smart";
          }
          {
            on = "?";
            run = "find --previous --smart";
          }
          {
            on = "n";
            run = "find_arrow";
          }
          {
            on = "N";
            run = "find_arrow --previous";
          }
          {
            on = [ "," "m" ];
            run = [ "sort modified --reverse=no" "linemode mtime" ];
          }
          {
            on = [ "," "M" ];
            run = [ "sort modified --reverse" "linemode mtime" ];
          }
          {
            on = [ "," "c" ];
            run = [ "sort created --reverse=no" "linemode ctime" ];
          }
          {
            on = [ "," "C" ];
            run = [ "sort created --reverse" "linemode ctime" ];
          }
          {
            on = [ "," "e" ];
            run = "sort extension --reverse=no";
          }
          {
            on = [ "," "E" ];
            run = "sort extension --reverse";
          }
          {
            on = [ "," "a" ];
            run = "sort alphabetical --reverse=no";
          }
          {
            on = [ "," "A" ];
            run = "sort alphabetical --reverse";
          }
          {
            on = [ "," "n" ];
            run = "sort natural --reverse=no";
          }
          {
            on = [ "," "N" ];
            run = "sort natural --reverse";
          }
          {
            on = [ "," "s" ];
            run = [ "sort size --reverse=no" "linemode size" ];
          }
          {
            on = [ "," "S" ];
            run = [ "sort size --reverse" "linemode size" ];
          }
          {
            on = [ "," "r" ];
            run = "sort random --reverse=no";
          }
          {
            on = [ "g" "h" ];
            run = "cd ~";
          }
          {
            on = [ "g" "c" ];
            run = "cd ~/.config";
          }
          {
            on = [ "g" "d" ];
            run = "cd ~/Downloads";
          }
          {
            on = [ "g" "<Space>" ];
            run = "cd --interactive";
          }
          {
            on = "t";
            run = "tab_create --current";
          }
          {
            on = "1";
            run = "tab_switch 0";
          }
          {
            on = "2";
            run = "tab_switch 1";
          }
          {
            on = "3";
            run = "tab_switch 2";
          }
          {
            on = "4";
            run = "tab_switch 3";
          }
          {
            on = "5";
            run = "tab_switch 4";
          }
          {
            on = "6";
            run = "tab_switch 5";
          }
          {
            on = "7";
            run = "tab_switch 6";
          }
          {
            on = "8";
            run = "tab_switch 7";
          }
          {
            on = "9";
            run = "tab_switch 8";
          }
          {
            on = "[";
            run = "tab_switch -1 --relative";
          }
          {
            on = "]";
            run = "tab_switch 1 --relative";
          }
          {
            on = "{";
            run = "tab_swap -1";
          } {
            on = "}";
            run = "tab_swap 1";
          }
          {
            on = "w";
            run = "tasks_show";
          }
          {
            on = "~";
            run = "help";
          }
          {
            on = "<F1>";
            run = "help";
          }
        ];
      };
      tasks = {
        keymap = [
          {
            on = "<Esc>";
            run = "close";
          }
          {
            on = "<C-[>";
            run = "close";
          }
          {
            on = "<C-c>";
            run = "close";
          }
          {
            on = "w";
            run = "close";
          }
          {
            on = "k";
            run = "arrow -1";
          }
          {
            on = "j";
            run = "arrow 1";
          }
          {
            on = "<Up>";
            run = "arrow -1";
          }
          {
            on = "<Down>";
            run = "arrow 1";
          }
          {
            on = "<Enter>";
            run = "inspect";
          }
          {
            on = "x";
            run = "cancel";
          }
          {
            on = "~";
            run = "help";
          }
          {
            on = "<F1>";
            run = "help";
          }
        ];
      };
      select = {
        keymap = [
          {
            on = "<Esc>";
            run = "close";
          }
          {
            on = "<C-[
              ";
            run = "close";
          }
          {
            on = "<C-c>";
            run = "close";
          }
          {
            on = "<Enter>";
            run = "close --submit";
          }
          {
            on = "k";
            run = "arrow -1";
          }
          {
            on = "j";
            run = "arrow 1";
          }
          {
            on = "<Up>";
            run = "arrow -1";
          }
          {
            on = "<Down>";
            run = "arrow 1";
          }
          {
            on = "~";
            run = "help";
          }
          {
            on = "<F1>";
            run = "help";
          }
        ];
      };
      input = {
        keymap = [
          {
            on = "<C-c>";
            run = "close";
          }
          {
            on = "<Enter>";
            run = "close --submit";
          }
          {
            on = "<Esc>";
            run = "escape";
          }
          {
            on = "<C-[>";
            run = "escape";
          }
          {
            on = "i";
            run = "insert";
          }
          {
            on = "a";
            run = "insert --append";
          }
          {
            on = "I";
            run = [ "move -999" "insert" ];
          }
          {
            on = "A";
            run = [ "move 999" "insert --append" ];
          }
          {
            on = "v";
            run = "visual";
          }
          {
            on = "V";
            run = [ "move -999" "visual" "move 999" ];
          }
          {
            on = "h";
            run = "move -1";
          }
          {
            on = "l";
            run = "move 1";
          }
          {
            on = "<Left>";
            run = "move -1";
          }
          {
            on = "<Right>";
            run = "move 1";
          }
          {
            on = "<C-b>";
            run = "move -1";
          }
          {
            on = "<C-f>";
            run = "move 1";
          }
          {
            on = "b";
            run = "backward";
          }
          {
            on = "w";
            run = "forward";
          }
          {
            on = "e";
            run = "forward --end-of-word";
          }
          {
            on = "<A-b>";
            run = "backward";
          }
          {
            on = "<A-f>";
            run = "forward --end-of-word";
          }
          {
            on = "0";
            run = "move -999";
          }
          {
            on = "$";
            run = "move 999";
          }
          {
            on = "<C-a>";
            run = "move -999";
          }
          {
            on = "<C-e>";
            run = "move 999";
          }
          {
            on = "<Home>";
            run = "move -999";
          }
          {
            on = "<End>";
            run = "move 999";
          }
          {
            on = "<Backspace>";
            run = "backspace";
          }
          {
            on = "<Delete>";
            run = "backspace --under";
          }
          {
            on = "<C-h>";
            run = "backspace";
          }
          {
            on = "<C-d>";
            run = "backspace --under";
          }
          {
            on = "<C-u>";
            run = "kill bol";
          }
          {
            on = "<C-k>";
            run = "kill eol";
          }
          {
            on = "<C-w>";
            run = "kill backward";
          }
          {
            on = "<A-d>";
            run = "kill forward";
          }
          {
            on = "d";
            run = "delete --cut";
          }
          {
            on = "D";
            run = [ "delete --cut" "move 999" ];
          }
          {
            on = "c";
            run = "delete --cut --insert";
          }
          {
            on = "C";
            run = [ "delete --cut --insert" "move 999" ];
          }
          {
            on = "x";
            run = [ "delete --cut" "move 1 --in-operating" ];
          }
          {
            on = "y";
            run = "yank";
          }
          {
            on = "p";
            run = "paste";
          }
          {
            on = "P";
            run = "paste --before";
          }
          {
            on = "u";
            run = "undo";
          }
          {
            on = "<C-r>";
            run = "redo";
          }
          {
            on = "~";
            run = "help";
          }
          {
            on = "<F1>";
            run = "help";
          }
        ];
      };
      confirm = {
        keymap = [
          {
            on = "<Esc>";
            run = "close";
          }
          {
            on = "<C-[>";
            run = "close";
          }
          {
            on = "<C-c>";
            run = "close";
          }
          {
            on = "<Enter>";
            run = "close --submit";
          }
          {
            on = "n";
            run = "close";
          }
          {
            on = "y";
            run = "close --submit";
          }
          {
            on = "k";
            run = "arrow -1";
          }
          {
            on = "j";
            run = "arrow 1";
          }
          {
            on = "<Up>";
            run = "arrow -1";
          }
          {
            on = "<Down>";
            run = "arrow 1";
          }
          {
            on = "~";
            run = "help";
          }
          {
            on = "<F1>";
            run = "help";
          }
        ];
      };
      completion = {
        keymap = [
          {
            on = "<C-c>";
            run = "close";
          }
          {
            on = "<Tab>";
            run = "close --submit";
          }
          {
            on = "<Enter>";
            run = [ "close --submit" "close_input --submit" ];
          }
          {
            on = "<A-k>";
            run = "arrow -1";
          }
          {
            on = "<A-j>";
            run = "arrow 1";
          }
          {
            on = "<Up>";
            run = "arrow -1";
          }
          {
            on = "<Down>";
            run = "arrow 1";
          }
          {
            on = "<C-p>";
            run = "arrow -1";
          }
          {
            on = "<C-n>";
            run = "arrow 1";
          }
          {
            on = "~";
            run = "help";
          }
          {
            on = "<F1>";
            run = "help";
          }
        ];
      };
      help = {
        keymap = [
          {
            on = "<Esc>";
            run = "escape";
          }
          {
            on = "<C-[>";
            run = "escape";
          }
          {
            on = "q";
            run = "close";
          }
          {
            on = "<C-c>";
            run = "close";
          }
          {
            on = "k";
            run = "arrow -1";
          }
          {
            on = "j";
            run = "arrow 1";
          }
          {
            on = "<Up>";
            run = "arrow -1";
          }
          {
            on = "<Down>";
            run = "arrow 1";
          }
          {
            on = "f";
            run = "filter";
          }
        ];
      };
    };
  };
}
