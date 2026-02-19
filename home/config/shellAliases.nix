{
  home.shellAliases = {
    # Git
    g = "git";
    gs = "git status";
    ga = "git add";
    gc = "git commit";
    gp = "git push";
    gl = "git pull";
    gd = "git diff";
    gb = "git branch";
    gco = "git checkout";
    gcb = "git checkout -b";
    
    # File System & Navigation

    # Directory navigation
    ".." = "cd ..";
    "..." = "cd ../..";
    "...." = "cd ../../..";
    
    # Directory listing (eza replacements)
    l = "eza -la --group-directories-first";
    ls = "eza --group-directories-first";
    ll = "eza -l --group-directories-first";
    la = "eza -la --group-directories-first";
    lt = "eza --tree";
    
    # File operations with safety
    rm = "rm -i";
    cp = "cp -i";
    mv = "mv -i";
    mkdir = "mkdir -p";
    
    # Development & Editing
    v = "nvim";
    vi = "nvim";
    vim = "nvim";
    
    # System & Utilities
    clr = "clear";
    ff = "fastfetch";
    reload-shell = "exec $SHELL";
    
    # Network Tools
    ping = "ping -c 5";
    wget = "wget -c";
  };
}
