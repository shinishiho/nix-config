{
  platform ? "linux",
  ...
}:

{
  imports = [
    ./editors
    ./browsers
    ./media
    ./gaming
    ./communication
  ];

  options.my-apps = {
    _module.args = { inherit platform; };
  };
}
