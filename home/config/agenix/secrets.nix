let
  w_ssh = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHMhcsbiH95BseVmErNQZgKefwoOopOl9ZKguv7WYVr";
  users = [ w_ssh ];
in
{
  "hass-longlive-token.age" = {
    publicKeys = users;
    armor = true;
  };
}
