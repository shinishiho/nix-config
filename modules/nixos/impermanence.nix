# Reusable impermanence module
{ lib, ... }:
{
  # This module provides common impermanence settings
  # Host-specific filesystem configurations have been moved to the host configuration

  # Common impermanence options
  options.impermanence = {
    # Add options here if needed
  };

  # Common impermanence configuration
  config = {
    # The actual filesystem configuration has been moved to host-specific config
    
    # Common impermanence settings that apply to all systems using impermanence
    environment.persistence = lib.mkDefault {};
    
    # Add more common impermanence settings here
  };
}
