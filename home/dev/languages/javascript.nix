# JavaScript/TypeScript development environment
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Node.js runtime
    nodejs
    
    # Package managers
    yarn
    pnpm
    
    # TypeScript
    typescript
    
    # Development tools
    nodePackages.prettier
    nodePackages.eslint
    nodePackages.typescript-language-server
  ];
}
