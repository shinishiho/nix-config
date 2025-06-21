# Python development environment
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Python interpreters
    python3
    python3Packages.pip
    python3Packages.virtualenv
    
    # Python development tools
    python3Packages.pytest
    python3Packages.black
    python3Packages.flake8
    python3Packages.mypy
    python3Packages.ipython
    
    # Poetry for dependency management
    poetry
    
    # Jupyter
    python3Packages.jupyter
    python3Packages.notebook
  ];
}
