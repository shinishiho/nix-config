{
  pkgs,
  ...
}:
{
  home.packages = with pkgs; [
    (writeShellScriptBin "s" ''
      #!/run/current-system/sw/bin/bash

      if [ "$#" -lt 2 ]; then
        echo "Usage: $0 <service: d|yt|gh|nixpkgs|nixos|hm|nix-darwin|wiki> <search query>"
        exit 1
      fi

      service="$1"
      shift
      query="$*"

      encoded_query=$(echo "$query" | ${pkgs.jq}/bin/jq -sRr @uri)

      case "$service" in
        d)
          url="https://duckduckgo.com/?q=$encoded_query"
        ;;
        yt)
          url="https://www.youtube.com/results?search_query=$encoded_query"
        ;;
        gh)
          url="https://github.com/search?q=$encoded_query"
        ;;
        nixpkgs)
          url="https://search.nixos.org/packages?channel=unstable&from=0&size=50&sort=relevance&type=packages&query=$encoded_query"
        ;;
        nixos)
          url="https://search.nixos.org/options?channel=unstable&query=$encoded_query"
        ;;
        hm)
          url="https://home-manager-options.extranix.com/?query=$encoded_query&release=master"
        ;;
        nix-darwin)
          url="https://options.nix-darwin.uz/?query=$encoded_query&release=master"
        ;;
        gpt)
          url="https://x.liaox.ai/?model=gpt-4o&q=$encoded_query"
        ;;
        wiki)
          url="https://en.wikipedia.org/w/index.php?search=$encoded_query"
        ;;
        *)
          # echo "Usage: $0 <service: d|yt|gh|nixpkgs|nixos|hm|nix-darwin|wiki> <search query>"
          exit 1
        ;;
      esac

      xdg-open "$url"
    '')
  ];
}
