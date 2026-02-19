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
        rev = "998ad4f5fc9cee36c09840a7e635b56428e554f9";
        sha256 = "sha256-GZ1ZpcaEfbcex6XvxOFJDJqoD9C5out0W4bkkn768r0=";
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
