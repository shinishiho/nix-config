# Database tools
{ pkgs, ... }:

{
  home.packages = with pkgs; [
    # Database clients
    postgresql  # PostgreSQL client (psql)
    mysql       # MySQL/MariaDB client
    sqlite      # SQLite client
    
    # NoSQL databases
    mongodb-tools
    redis
    
    # Database utilities
    pgcli       # Better PostgreSQL CLI
    mycli       # Better MySQL CLI
    litecli     # Better SQLite CLI
    
    # GUI database tools (optional)
    # dbeaver-bin
    # adminer
    
    # Database migration tools
    # flyway
    # liquibase
  ];
}
