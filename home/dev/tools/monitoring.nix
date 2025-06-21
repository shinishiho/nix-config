# System monitoring and observability tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # System monitoring
    htop
    btop        # Resource monitor
    iotop       # I/O monitor
    iftop       # Network monitor
    
    # Process monitoring
    procs       # Modern ps replacement
    
    # Disk usage
    du-dust     # Modern du replacement
    ncdu        # Disk usage analyzer
    
    # Log analysis
    lnav        # Log navigator
    
    # Performance profiling
    perf-tools  # Linux performance tools
    
    # Cloud monitoring (optional)
    # prometheus
    # grafana
    # jaeger
    
    # Application monitoring
    # newrelic-cli
    # datadog-agent
  ];
}
