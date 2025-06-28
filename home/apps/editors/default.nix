{
  platform ? "linux",
  ...
}:

{
  imports = [
    ./nvim
    ./zeditor

    ./cursor.nix
    ./vscode.nix
  ];
  
  # Pass platform to all imported modules
  _module.args = { inherit platform; };
}
