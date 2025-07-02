{
  lib,
  pkgs,
  wallpapers,
  ...
}:
let
  wallpaperScript = pkgs.writeShellScriptBin "set-wallpaper" ''
    #!/bin/bash
    
    # Configuration
    STATE_DIR="$HOME/.config/wallpaper"
    STATE_FILE="$STATE_DIR/current"
    SYMLINK_FILE="$STATE_DIR/active"
    
    # All available wallpapers
    WALLPAPERS=(
        "${wallpapers.dark}"
        "${wallpapers.light}"
        "${wallpapers.angelina}"
        "${wallpapers.beans}"
        "${wallpapers.burning_cherry}"
        "${wallpapers.cat_lofi_cafe}"
        "${wallpapers.chainsaw_makima}"
        "${wallpapers.flying_out}"
        "${wallpapers.jormungandr}"
        "${wallpapers.lowpoly_street}"
        "${wallpapers.reindeer_forest}"
        "${wallpapers.tokyo_pink}"
        "${wallpapers.waifu_angel}"
        "${wallpapers.waifu_pink}"
    )
    
    # Create state directory if it doesn't exist
    mkdir -p "$STATE_DIR"
    
    # Function to set wallpaper
    set_wallpaper() {
        local wallpaper_path="$1"
        
        # Validate wallpaper file exists
        if [[ ! -f "$wallpaper_path" ]]; then
            echo "Error: Wallpaper file '$wallpaper_path' not found!"
            exit 1
        fi
        
        echo "Setting wallpaper: $wallpaper_path"

        # Set wallpaper with swww
        ${pkgs.swww}/bin/swww img "$wallpaper_path"
        ${pkgs.hyprpanel}/bin/hyprpanel setWallpaper "$wallpaper_path"

        # Run wallust for color scheme generation
        ${pkgs.wallust}/bin/wallust run "$wallpaper_path"
        
        # Save current wallpaper path to state file
        echo "$wallpaper_path" > "$STATE_FILE"
        
        # Create symlink to active wallpaper
        rm -f "$SYMLINK_FILE"
        ln -s "$wallpaper_path" "$SYMLINK_FILE"
        
        echo "Wallpaper set successfully!"
    }
    
    # Function to get current wallpaper or run init if no state
    get_current_wallpaper() {
        if [[ -f "$STATE_FILE" ]]; then
            cat "$STATE_FILE"
        else
            # No state file exists, initialize with random wallpaper
            set_wallpaper "$(get_random_wallpaper)"
            cat "$STATE_FILE"
        fi
    }
    
    # Function to get a random wallpaper
    get_random_wallpaper() {
        local random_index=$((RANDOM % ''${#WALLPAPERS[@]}))
        echo "''${WALLPAPERS[$random_index]}"
    }
    
    # Function to list available wallpapers
    list_wallpapers() {
        printf '%s\n' "''${WALLPAPERS[@]}"
    }
    
    # Function to select wallpaper using rofi
    select_wallpaper() {
        local wallpapers_list
        wallpapers_list=$(list_wallpapers)
        
        # Create arrays to store display names and paths
        local display_names=()
        local wallpaper_paths=()
        local rofi_input=""
        local current_wallpaper
        current_wallpaper=$(get_current_wallpaper)
        
        while IFS= read -r wallpaper; do
            local basename_wallpaper
            basename_wallpaper=$(basename "$wallpaper")
            
            # Mark current wallpaper
            if [[ "$wallpaper" == "$current_wallpaper" ]]; then
                basename_wallpaper="● $basename_wallpaper"
            fi
            
            display_names+=("$basename_wallpaper")
            wallpaper_paths+=("$wallpaper")
            rofi_input+="$basename_wallpaper"$'\n'
        done <<< "$wallpapers_list"
        
        # Remove trailing newline
        rofi_input=$(echo -e "$rofi_input" | head -c -1)
        
        # Use rofi to select wallpaper
        local selected
        selected=$(echo -e "$rofi_input" | ${pkgs.rofi-wayland}/bin/rofi -dmenu -i -p "Select Wallpaper" -no-custom)
        
        if [[ -n "$selected" ]]; then
            # Find the index of the selected display name
            local selected_path=""
            for i in "''${!display_names[@]}"; do
                if [[ "''${display_names[$i]}" == "$selected" ]]; then
                    selected_path="''${wallpaper_paths[$i]}"
                    break
                fi
            done
            
            if [[ -n "$selected_path" ]] && [[ -f "$selected_path" ]]; then
                set_wallpaper "$selected_path"
            else
                echo "Error: Selected wallpaper not found: $selected_path"
                exit 1
            fi
        else
            echo "No wallpaper selected"
            exit 0
        fi
    }
    
    # Main script logic
    case "''${1:-}" in
        "current")
            get_current_wallpaper
            ;;
        "select")
            select_wallpaper
            ;;
        "init")
            # Initialize with random wallpaper
            set_wallpaper "$(get_random_wallpaper)"
            ;;
        *)
            if [[ -n "$1" ]] && [[ -f "$1" ]]; then
                # Custom wallpaper path provided
                set_wallpaper "$1"
            else
                echo "Usage: set-wallpaper [current|select|init|<path>]"
                echo ""
                echo "Commands:"
                echo "  current  - Show current wallpaper path (or initialize if none set)"
                echo "  select   - Select wallpaper from rofi menu"
                echo "  init     - Initialize with random wallpaper"
                echo "  <path>   - Set custom wallpaper from path"
                echo ""
                echo "Current wallpaper: $(get_current_wallpaper)"
                echo "Active wallpaper symlink: $SYMLINK_FILE"
                exit 1
            fi
            ;;
    esac
  '';
in
{
  home.packages = [ wallpaperScript ];
}
