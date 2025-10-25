{
  config,
  lib,
  ...
}:

with lib;

{
  programs.fish.functions.y = mkIf config.programs.yazi.enable ''
set tmp (mktemp -t "yazi-cwd.XXXXXX")
yazi $argv --cwd-file="$tmp"
if read -z cwd < "$tmp"; and [ -n "$cwd" ]; and [ "$cwd" != "$PWD" ]
  builtin cd -- "$cwd"
end
rm -f -- "$tmp"
  '';
}
