{
  platform ? "linux",
  ...
}:

{
  imports = [
    ./browsers
    ./communication
    ./editors
    ./media
    ./gaming
  ];

  options.my-apps = {
    _module.args = { inherit platform; };
  };
}
