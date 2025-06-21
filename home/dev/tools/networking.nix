# Network development tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # HTTP clients
    curl
    wget
    httpie      # Modern HTTP client
    
    # API testing
    # postman
    # insomnia
    
    # Network analysis
    nmap
    netcat-gnu
    tcpdump
    wireshark   # Network protocol analyzer
    
    # DNS tools
    dig
    host
    dnsutils
    
    # Load testing
    # wrk
    # hey
    # ab  # Apache bench
    
    # Proxy and tunneling
    # ngrok
    # cloudflared
    
    # Network monitoring
    bandwhich   # Network utilization by process
    nethogs     # Network usage monitor
  ];
}
