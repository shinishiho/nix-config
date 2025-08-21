{
  pkgs,
  ...
}:
{
  programs.fish.plugins = [
    {
      name = "done";
      src = pkgs.fetchFromGitHub {
        owner = "franciscolourenco";
        repo = "done";
        rev = "0bfe402753681f705a482694fcaf20c2bfc6deb7";
        sha256 = "sha256-WA6DBrPBuXRIloO05UBunTJ9N01d6tO1K1uqojjO0mo=";
      };
    }
    {
      name = "pisces";
      src = pkgs.fetchFromGitHub {
        owner = "laughedelic";
        repo = "pisces";
        rev = "e45e0869855d089ba1e628b6248434b2dfa709c4";
        sha256 = "sha256-Oou2IeNNAqR00ZT3bss/DbhrJjGeMsn9dBBYhgdafBw=";
      };
    }
  ];
}
