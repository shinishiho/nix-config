# Rust development environment
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Rust toolchain
    rustc
    cargo
    rustfmt
    rust-analyzer
    clippy
    
    # Additional Rust tools
    cargo-watch
    cargo-edit
    cargo-outdated
  ];
}
