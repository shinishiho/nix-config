# Testing and quality assurance tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Load testing
    wrk
    hey
    
    # Security testing
    # sqlmap
    # nikto
    # dirb
    
    # Code quality
    # sonarqube-scanner
    
    # Performance testing
    hyperfine
    
    # API testing
    # newman  # Postman CLI
    
    # Browser testing
    # selenium-server-standalone
    # chromedriver
    # geckodriver
    
    # Mock services
    # wiremock
    
    # Chaos engineering
    # chaos-mesh
  ];
}
