{
  programs.fish.functions.music = ''
set music_dir ~/w/0_w/2_music

if test (count $argv) -eq 0
    echo "Usage: music <query>"
    echo "  Matches a folder name directly, or fuzzy-searches all files."
    return 1
end

set query (string join " " $argv)

for dir in $music_dir/*/
    set folder_name (basename $dir)
    if test "$folder_name" = "$query"
        echo "Playing folder: $dir"
        mpv --no-video "$dir"
        return 0
    end
end

set best_file (fd --type f -e mp3 -e flac -e ogg -e wav -e m4a -e opus -e aac . $music_dir \
    | fzf --filter="$query" | head -1)

if test -z "$best_file"
    echo "No match found for: $query"
    return 1
end

echo "Playing file: $best_file"
mpv --no-video "$best_file"
  '';
}
