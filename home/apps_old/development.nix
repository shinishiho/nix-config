# Development applications
{ pkgs, ... }:

{
  # Code editors
  vscode.enable = true;
  cursor.enable = false;
  zed.enable = false;
  
  # Development packages
  home.packages = with pkgs; [
    # File comparison
    meld
    
    # Database tools
    # dbeaver-bin
    # mongodb-compass
    
    # API testing
    # postman
    # insomnia
    
    # Containers
    # docker-compose
    
    # Version control GUI
    # gitbutler
    # sourcetree  # macOS only
  ];
}
