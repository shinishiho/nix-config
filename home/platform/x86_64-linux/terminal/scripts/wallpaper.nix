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
        "${wallpapers.shinshi}"
        "${wallpapers.shinshi_2}"
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

        # Save current wallpaper path to state file
        echo "$wallpaper_path" > "$STATE_FILE"
        
        # Create symlink to active wallpaper
        rm -f "$SYMLINK_FILE"
        ln -s "$wallpaper_path" "$SYMLINK_FILE"
        
        # Set wallpaper with swww
        ${pkgs.swww}/bin/swww img "$wallpaper_path" --transition-bezier .43,1.19,1,.4 --transition-type "grow" --transition-duration "0.4" --transition-fps "60" --invert-y --transition-pos "$(hyprctl cursorpos | grep -E '^[0-9]' || echo "0,0")" &
        
        ${pkgs.hyprpanel}/bin/hyprpanel setWallpaper "$wallpaper_path"

        # Run wallust for color scheme generation
        ${pkgs.wallust}/bin/wallust run "$wallpaper_path"
        
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
        local array_size=''${#WALLPAPERS[@]}
        local random_index
        
        # Use multiple sources for better randomness
        if command -v shuf >/dev/null 2>&1; then
            # Use shuf if available (most robust)
            random_index=$(seq 0 $((array_size - 1)) | shuf -n 1)
        elif [[ -r /dev/urandom ]]; then
            # Use /dev/urandom for better entropy
            random_index=$(od -An -N2 -tu2 /dev/urandom | tr -d ' ' | head -1)
            random_index=$((random_index % array_size))
        else
            # Fallback: combine multiple RANDOM calls and current time for better distribution
            local seed1=$RANDOM
            local seed2=$RANDOM
            local timestamp=$(date +%N 2>/dev/null || echo $(($(date +%s) % 1000000)))
            random_index=$(( (seed1 * seed2 + timestamp) % array_size ))
        fi
        
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
        
        local current_wallpaper
        current_wallpaper=$(get_current_wallpaper)
        
        # Generate rofi input with proper format using a function
        generate_rofi_entry() {
            local wallpaper="$1"
            local basename_wallpaper
            basename_wallpaper=$(basename "$wallpaper")
            
            # Mark current wallpaper
            if [[ "$wallpaper" == "$current_wallpaper" ]]; then
                basename_wallpaper="● $basename_wallpaper"
            fi
            
            # Format: displayName:::realpath:::pathtopreview\0icon\x1fpathtopreview
            printf "%s:::%s:::%s\0icon\x1f%s\n" "$basename_wallpaper" "$wallpaper" "$wallpaper" "$wallpaper"
        }
        
        # Use rofi to select wallpaper with enhanced display
        local selected
        selected=$(
            while IFS= read -r wallpaper; do
                generate_rofi_entry "$wallpaper"
            done <<< "$wallpapers_list" | ${pkgs.rofi-wayland}/bin/rofi -dmenu -display-column-separator ":::" -theme ~/.config/rofi/selector.rasi -display-columns 1 -i -p "Select Wallpaper" -no-custom -select $(basename "$(get_current_wallpaper)")
        )
        
        if [[ -n "$selected" ]]; then
            # Extract the real path from the selected entry (second field)
            local selected_path
            selected_path=$(echo "$selected" | cut -d':' -f4)  # Get the realpath part
            
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
