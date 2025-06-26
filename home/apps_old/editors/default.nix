# Editor applications
{ platform ? "linux", ... }:

{
  imports = [
    ./cursor.nix
    ./vscode.nix
    ./nvim
    ./zeditor
  ];
  
  _module.args = { inherit platform; };
}
