let
  w_yubikey = "age1yubikey1qdekxahdeksc8wxc97uun559c2ntwshndeq5jawwuguarkswuerz5qzweh4";
  w_ssh = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAINHMhcsbiH95BseVmErNQZgKefwoOopOl9ZKguv7WYVr";
  users = [ w_yubikey w_ssh ];

  # iamw = "random key";
  # systems = [ iamw ];

  # all = users ++ systems;
in
{
  "hass-longlive-token.age" = {
    publicKeys = users;
    armor = true;
  };
}
