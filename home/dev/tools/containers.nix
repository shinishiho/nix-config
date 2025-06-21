# Container development tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Container runtimes
    docker
    docker-compose
    
    # Alternative container tools
    podman
    podman-compose
    
    # Container utilities
    dive         # Docker image explorer
    lazydocker   # Terminal UI for Docker
    ctop         # Container metrics
    
    # Kubernetes tools
    kubectl
    kubectx      # Switch between clusters
    kubens       # Switch between namespaces
    kubernetes-helm
    
    # Registry tools
    skopeo       # Work with container images
    crane        # Container registry client
  ];
}
